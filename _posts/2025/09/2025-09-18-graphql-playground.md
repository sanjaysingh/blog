---
layout: single
title: "In-Browser GraphQL Playground"
date: 2025-09-17 10:00:00 +0000
categories: [Tools, GraphQL]
tags: [graphql, monaco, javascript, web-tools, playground, deep-linking]
---

Hey folks!

I put together a lightweight, modern GraphQL playground that runs entirely in your browser. It uses Monaco Editor for the editing experience and GraphQL.js for execution — no servers or frameworks required.

- **Live demo**: [gql.sanjaysingh.net](https://gql.sanjaysingh.net)
- **Source code**: [github.com/sanjaysingh/gql-playground](https://github.com/sanjaysingh/gql-playground)

## What it is

A self-contained GraphQL playground you can open in any browser. It includes:

- **Interactive Query Editor** with Monaco: syntax highlighting, autocompletion
- **Real-time Query Execution** using in-memory sample data
- **Sample Queries** to explore the schema quickly
- **Sample Data Viewer** for users and posts
- **Deep Linking** so queries are encoded in the URL for easy sharing
- **Mobile Responsive** layout

## Why I built it

I wanted a teaching and demo tool for GraphQL that anyone can open, tweak, and share — without a backend or build step. Deep links make it easy to bookmark examples or drop links in docs and slides.

## Deep linking examples

The playground keeps your query synced to the URL so you can share exactly what you’re looking at. When a URL is opened, the query auto-loads and executes.

- Basic users query:
  - `http://localhost:8000/?query=query%20%7B%0A%20%20users%20%7B%0A%20%20%20%20id%0A%20%20%20%20name%0A%20%20%20%20email%0A%20%20%7D%0A%7D`
- Specific user by id:
  - `http://localhost:8000/?query=query%20GetUserById%20%7B%0A%20%20user(id%3A%20%225%22)%20%7B%0A%20%20%20%20id%0A%20%20%20%20name%0A%20%20%20%20email%0A%20%20%7D%0A%7D`
- Posts with authors:
  - `http://localhost:8000/?query=query%20GetPostsWithAuthors%20%7B%0A%20%20posts(limit%3A%205)%20%7B%0A%20%20%20%20id%0A%20%20%20%20title%0A%20%20%20%20author%20%7B%0A%20%20%20%20%20%20name%0A%20%20%20%20%20%20email%0A%20%20%20%20%7D%0A%20%20%7D%0A%7D`

## Schema and sample data

- **Users**: 50 sample users with `id`, `name`, `email`
- **Posts**: ~200 sample posts with `id`, `title`, `content`, and `author` relationship
- Query support includes fetching single items, lists, pagination, and relationships.

## Try it locally

You can open `index.html` directly in a browser, or serve the folder with any static server:

```bash
python -m http.server 8000
# or
npx serve .
# or
php -S localhost:8000
```

Then open `http://localhost:8000`.

## Tech stack

- **Monaco Editor** for a rich editing experience
- **GraphQL.js** to parse and execute queries
- **Tailwind CSS** for responsive UI
- **Vanilla JavaScript** for maximum portability

## Links

- Live: [gql.sanjaysingh.net](https://gql.sanjaysingh.net)
- Code: [sanjaysingh/gql-playground](https://github.com/sanjaysingh/gql-playground)

If you have ideas for improving the schema, adding sample queries, or tweaking the UI/UX, feel free to send PRs or open issues.

References: [GitHub – gql-playground](https://github.com/sanjaysingh/gql-playground) 