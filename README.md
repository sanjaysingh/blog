# My Personal Blog

This is a my personal blog. It is based off Jekyll. It can be run locally using either Docker or traditional Ruby setup.

## Prerequisites

### Option 1: Using Docker (Recommended)
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Option 2: Traditional Setup
- [Ruby](https://www.ruby-lang.org/en/downloads/) (version 2.7.0 or higher)
- [RubyGems](https://rubygems.org/pages/download)
- [Bundler](https://bundler.io/)

## Running Locally

### Using Docker (Recommended)

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd blog
   ```

2. Start the Jekyll server using Docker Compose:
   ```bash
   docker-compose up
   ```

3. Access the blog at [http://localhost:4000](http://localhost:4000)

The blog will automatically rebuild when you make changes to the source files.

### Traditional Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd blog
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Start the Jekyll server:
   ```bash
   bundle exec jekyll serve
   ```

4. Access the blog at [http://localhost:4000](http://localhost:4000)

## Development

### File Structure
- `_posts/`: Contains blog post files in Markdown format
- `_pages/`: Contains static pages
- `_config.yml`: Main configuration file
- `assets/`: Contains images, CSS, and JavaScript files
- `_data/`: Contains data files for customization
- `_includes/`: Contains reusable components
- `_layouts/`: Contains templates for different types of pages

### Creating New Posts

1. Create a new Markdown file in the `_posts` directory with the format:
   ```
   YYYY-MM-DD-title.md
   ```

2. Add the front matter at the top of the file:
   ```yaml
   ---
   title: "Your Post Title"
   date: YYYY-MM-DD
   categories:
     - category1
     - category2
   tags:
     - tag1
     - tag2
   ---
   ```

3. Write your post content in Markdown format below the front matter.

## Testing

1. After making changes, check that:
   - The site builds successfully without errors
   - All links work correctly
   - Images are displayed properly
   - Responsive design works on different screen sizes

2. Test the site in different browsers to ensure compatibility.

## Deployment

The site is automatically deployed through GitHub Pages when changes are pushed to the main branch.
