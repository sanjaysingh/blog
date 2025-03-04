---
layout: single
title: "Migrating from Blogger to Jekyll/Github Pages"
date: 2025-03-03 08:39:00 +0000
categories: [Tools, Migration, Jekyll]
tags: [blogger, jekyll, docker, migration, static-site]
image:
  alt: "Blogger to Jekyll Migration Tool"
---

I recently migrated my blog from Blogger to Github Pages. I've created a Docker-based migration tool that makes this process seamless and efficient. Let me introduce you to the Blogger to Jekyll Migration Tool. Note that Jekyll is used by Github Pages so once you have migrated to Jekyll, you can commit that to a repo and Github Pages will serve that just like a Jekyll server.

## Why Migrate from Blogger to Jekyll?

Blogger has been a reliable platform for many years, but static site generators like Jekyll offer several advantages. Github pages also allows to own the contents and you have full control over the blogs you publish.

- Better performance and faster load times
- More control over your site's design and functionality
- No dependency on Google's services
- Free hosting options like GitHub Pages
- Better SEO capabilities
- Modern development workflow

## Features of the Migration Tool

The tool I've developed handles the entire migration process automatically:

- Converts Blogger posts to Jekyll format
- Downloads and localizes all images from your posts
- Organizes content by year and month
- Preserves post metadata and categories
- Converts HTML content to clean Markdown
- Sets up a modern, responsive theme (Minimal Mistakes)

## How It Works

The migration process is containerized using Docker, ensuring a consistent environment across different operating systems. Here's what happens under the hood:

1. The tool processes your Blogger XML export
2. Downloads and optimizes all images
3. Converts HTML content to Markdown
4. Organizes posts chronologically
5. Sets up a complete Jekyll site structure

## Getting Started

The migration process is straightforward:

```bash
# 1. Place your Blogger XML export in the project directory
# 2. Run the migration
docker-compose up

# 3. Your new Jekyll site will be ready in the migrated-blog-server directory and you can run it from there.

cd migrated-blog-server
bundle exec jekyll serve

```

## Customization Options

After migration, you can easily customize your new Jekyll site:

- Modify the `_config.yml` file for site-wide settings
- Customize the Minimal Mistakes theme
- Add your own CSS and JavaScript
- Configure SEO settings
- Set up analytics


## Try It Out

The project is open source and available on [GitHub](https://github.com/sanjaysingh/blogger-to-githubpages). You can use the included sample blog XML to test the migration process before using it with your own blog.

