---
layout: single
title: "An Offline Code Editor"
date: 2025-04-05 15:00:00 +0000
categories: [Tools, Web]
tags: [editor, javascript, static-site, web-tools, offline, monaco]
---

Hey everyone,

Sharing another little tool I whipped up: an [Offline Code Editor](https://static.sanjaysingh.net/editor/). Think of it as a super-stripped-down VS Code that runs entirely in your browser and works offline.

Sometimes you just need a decent place to quickly view or edit a code snippet or a text file without firing up a full IDE. And crucially, you don't want to rely on some online tool that might be sending your code off somewhere.

## What It Is (and what it can do)

It's more than just a basic text area:
- **Powered by Monaco:** It uses the same editor engine that powers VS Code, so you get a familiar feel.
- **Syntax Highlighting:** Supports a bunch of languages out of the box (JavaScript, Python, HTML, CSS, Java, C#, C++, SQL, YAML, JSON, Markdown, and more!).
- **Language Auto-Detection:** Tries to figure out the language from the file extension or even the content itself.
- **Works Offline:** Once the page loads, it's good to go, no internet needed.
- **Themes:** Comes with Dark (default), Light, and High Contrast themes.
- **Basic Formatting:** Can auto-format code (Alt+Shift+F or on paste) for several languages.
- **Editor Goodies:** Includes line numbers, code folding, bracket matching, find/replace, auto-indent, and more.

## Why It's Useful

- **Privacy First:** Your files stay on your machine. It even actively blocks network requests to be extra sure.
- **Simplicity:** While powerful under the hood, the interface is clean and focused.
- **Offline Access:** Perfect for quick edits on the go, even without Wi-Fi.
- **Speed:** Loads fast, ready when you need it.
- **Familiar Feel:** If you use VS Code, you'll feel somewhat at home.

## How It Works

Built with just HTML, CSS, and JavaScript, using the Monaco Editor library. No server-side stuff involved.

1. Go to [https://static.sanjaysingh.net/editor/](https://static.sanjaysingh.net/editor/)
2. Open a text or code file onto the page, or Just paste, or start writing.
3. When code is pasted, editor will try to detect the language.
4. Make your edits using the familiar editor features.
5. Hit `Ctrl+S` (or `Cmd+S` on Mac) to download the edited content as a new file.


## Check It Out

Give it a try here: [https://static.sanjaysingh.net/editor/](https://static.sanjaysingh.net/editor/)

The source code, if you're curious, is on [GitHub](https://github.com/sanjaysingh/staticsites/tree/master/editor).
