---
layout: single
title: "Cursor Control Plane, Rewritten on the Official SDK"
date: 2026-05-31 10:00:00 +0000
categories: [Tools, Automation, Cursor]
tags: [cursor, cursor-sdk, telegram, web-ui, github, automation, remote-workflow, typescript]
---

In [March I wrote about Cursor-ControlPlane]({% post_url 2026/03/2026-03-25-cursor-controlplane %}) — a way to drive Cursor CLI sessions on my own machine from a web dashboard or Telegram chat. The goal was the same then as now: keep work on my local environment (databases, Docker, SSH keys, private networks) while still being able to kick off a session from my phone and follow it through to a pull request.

That first version worked, but it was built on a layer I did not own. It spawned the `agent acp` subprocess and spoke JSON-RPC over newline-delimited stdin/stdout — essentially a custom client for Cursor's ACP wire protocol. Model discovery came from parsing `agent models` output. On Windows I had to wrap `.cmd` and `.ps1` shims so subprocesses would start reliably. Every Cursor CLI release was a compatibility risk, and the old README even warned that the ACP format might change.

Cursor has since shipped the official [`@cursor/sdk`](https://www.npmjs.com/package/@cursor/sdk). That was the signal to rewrite. The new project is [cursor-cp](https://github.com/sanjaysingh/cursor-cp) — same idea, cleaner foundation.

## Why the SDK is the better fit

The old control plane treated the CLI as a black box: start a process, pipe JSON, hope the protocol stayed stable. The SDK inverts that. Cursor documents the API, ships TypeScript types, and owns the agent lifecycle.

In practice that means:

- **No subprocess juggling.** The old `AcpClient` managed process groups, stderr tails, graceful kills, and Windows `taskkill` fallbacks. The new `AgentService` calls `Agent.create()`, `agent.send()`, and disposes cleanly with `Symbol.asyncDispose`.
- **Structured streaming.** Responses arrive as typed events (`assistant`, `request`, `task`, and so on) through `run.stream()` instead of hand-parsing `session/update` chunks and guessing which ones were real assistant text.
- **Session resume across restarts.** Each session stores a `sdk_agent_id` in SQLite. After a server restart, the control plane calls `Agent.resume()` and picks up where it left off. The old version kept one long-lived CLI process per session; restart the service and that context was gone.
- **Model listing via API.** `Cursor.models.list()` replaces shelling out to `agent models` and normalizing CLI output.
- **Local execution stays local.** `Agent.create()` accepts a `local.cwd` so agents still run in your workspace on your machine — the same reason I built the original.

The core loop is now a few lines instead of hundreds of protocol plumbing:

```typescript
const agent = await Agent.create({
  apiKey,
  model: { id: effectiveModel },
  local: { cwd: workspacePath, settingSources: [] },
});

const run = await agent.send(prompt);
for await (const event of run.stream()) {
  // handle assistant text, questions, status
}
const result = await run.wait();
```

That is the integration surface I wanted from the start.

## What stayed the same

If you used the first version, the workflow should feel familiar:

- Web dashboard with real-time WebSocket streaming
- Telegram bot with inline buttons for sessions, models, and repos
- Pick a local folder or clone a GitHub repo with `gh`, then chat with the agent
- Up to five concurrent sessions, each scoped to a workspace and model
- Phone → change → commit → push → PR, all on your own hardware

The GitHub workflow from the earlier post still applies. The control plane is a remote control; the agent does the work where your environment already exists.

## What changed

| | Old (`cursor-controlplane`) | New (`cursor-cp`) |
|---|---|---|
| Language | Python | TypeScript (Node 20+) |
| Agent integration | `agent acp` subprocess + custom JSON-RPC client | Official `@cursor/sdk` |
| Install | PyInstaller binary + shell/PowerShell scripts | `curl \| bash` → `~/.local/share/cursor-cp` |
| Config | `.env` + `config.yaml` + SQLite overrides | `~/cursor-cp/config.yaml` (merged with defaults) |
| Default port | 8080 | 8747 |
| Windows service | Scheduled Task support | Foreground only for now |
| Session persistence | In-memory CLI process | SDK agent IDs stored in SQLite, resumed on restart |

The new repo is a clean break, not a drop-in upgrade. If you are on the Python version and it works for you, nothing forces a move. But if you want the supported API path — or session resume after restarts — `cursor-cp` is where active development lives.

## Quick start

**macOS / Linux**

```sh
curl -fsSL https://raw.githubusercontent.com/sanjaysingh/cursor-cp/main/install.sh | bash
cursor-cp setup    # API key, model, port, optional Telegram, daemon
cursor-cp            # http://localhost:8747
```

The setup wizard walks through your Cursor API key ([get one from the dashboard](https://cursor.com/dashboard/cloud-agents)), default model, and optional Telegram bot. On macOS and Linux you can enable a user-level daemon so it starts on login.

For day-to-day checks: `cursor-cp doctor`.

**From source**

```sh
git clone https://github.com/sanjaysingh/cursor-cp.git
cd cursor-cp
npm install
cp config.default.yaml config.yaml   # set cursor.api_key
npm run dev
```

## Closing thought

The first control plane proved the workflow: remote access to local Cursor agents is useful, especially when your real environment cannot move to the cloud. The rewrite does not change that thesis. It changes the plumbing — from reverse-engineered CLI protocol to a supported SDK — which makes the project easier to maintain and better positioned for whatever Cursor ships next.

Source: [https://github.com/sanjaysingh/cursor-cp](https://github.com/sanjaysingh/cursor-cp)

Previous version (archived approach): [https://github.com/sanjaysingh/cursor-controlplane](https://github.com/sanjaysingh/cursor-controlplane)
