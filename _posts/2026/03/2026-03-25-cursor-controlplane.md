---
layout: single
title: "Cursor-ControlPlane: Run Cursor CLI From Your Phone"
date: 2026-03-25 10:00:00 +0000
categories: [Tools, Automation, Cursor]
tags: [cursor, cursor-cli, telegram, web-ui, github, automation, remote-workflow]
---

I built [Cursor-ControlPlane](https://github.com/sanjaysingh/cursor-controlplane) to control Cursor CLI sessions on my own machine from a web UI or a Telegram chat.

The main reason for building this was that I wanted to work on projects on my own machine and not on Cursor Cloud. Many projects already have the right environment locally with databases, Docker containers, SSH keys, GitHub auth, private network access, and other setup that I do not want to recreate elsewhere. At the same time I wanted to control those sessions from my phone.

Cursor-ControlPlane solves that by letting me start and manage persistent Cursor CLI sessions through web and Telegram while everything still runs on my own machine.

## Features

- Start Cursor CLI sessions in a selected repo or workspace
- Manage sessions from a web dashboard or Telegram
- Keep sessions persistent so follow-up prompts continue in the same context
- See streamed updates and answer agent questions
- Pick local folders or clone GitHub repos into the workspace

## GitHub workflow

If GitHub is configured on the host machine then this becomes even more useful. I can clone a repo, ask Cursor to make a change, and then commit, push and raise a pull request from the same chat flow in web or Telegram.

This means I can go from phone to PR while the actual work still happens on my own machine.

## Installation

**Linux / macOS**

```sh
curl -fsSL https://raw.githubusercontent.com/sanjaysingh/cursor-controlplane/main/scripts/install.sh | bash
```

**Windows (PowerShell)**

```sh
irm https://raw.githubusercontent.com/sanjaysingh/cursor-controlplane/main/scripts/install.ps1 | iex
```

The source is at [https://github.com/sanjaysingh/cursor-controlplane](https://github.com/sanjaysingh/cursor-controlplane)
