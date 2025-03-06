---
layout: single
title: "AAD JWT Token Generator: A Web-Based Azure AD Token Generation Tool"
date: 2025-03-05 08:00:00 +0000
categories: [Tools, Azure, Authentication]
tags: [azure-ad, jwt, golang, vue.js, tailwind-css, docker]
image:
  path: /assets/images/aad-jwt-gen.png
  alt: "AAD JWT Token Generator"
---

I'm excited to share a new tool I've developed called [AAD JWT Token Generator](https://github.com/sanjaysingh/aad-jwt-gen), a web-based application designed to simplify the process of generating JWT tokens from Azure AD. Whether you're a developer testing Azure AD-protected APIs or an administrator verifying token claims, this tool makes the token generation process straightforward and efficient.

## Why I Built This Tool

Working with Azure AD-protected services often requires generating and testing JWT tokens. While there are various ways to obtain these tokens, I found myself wanting a more streamlined solution that could:

1. Provide a clean, modern web interface
2. Support both GUI and command-line usage
3. Be easily deployable anywhere
4. Work without storing sensitive credentials

## Key Features

The AAD JWT Token Generator comes with several powerful features:

- **Modern Web Interface**: Built with Vue.js and styled with Tailwind CSS for a clean, professional look
- **Flexible Token Generation**: Customize your tokens with various parameters
- **Headless Mode**: Generate tokens via command line without launching the web interface
- **Docker Support**: Easy deployment using containers
- **Single Binary**: All frontend assets are embedded for simple distribution

## How to Use It

### Web Interface

The web interface is the easiest way to get started. Simply:

1. Run the application (either directly or via Docker)
2. Navigate to http://localhost:5555
3. Enter your Azure AD credentials:
   - Client ID
   - Tenant ID
   - Client Secret
   - Scope (optional)
4. Click "Generate Token"

### Command Line

For automation scenarios, use the headless mode:

```bash
aad-jwt-gen -headless \
  -clientId="your_client_id" \
  -tenantId="your_tenant_id" \
  -clientSecret="your_client_secret" \
  -scope="your_scope"
```

### Docker Deployment

If you prefer using Docker:

```bash
docker pull sanjaysingh/aad-jwt-gen
docker run -p 5555:5555 sanjaysingh/aad-jwt-gen
```

## Technical Details

The tool is built with:

- **Backend**: Go 1.21.0+
- **Frontend**: Vue.js with Tailwind CSS
- **Containerization**: Docker
- **Architecture**: Client-server with embedded static files

## Getting Started

### Installation

Choose your preferred installation method:

Using Go:
```bash
go install github.com/sanjaysingh/aad-jwt-gen@latest
```

Using Docker:
```bash
docker pull sanjaysingh/aad-jwt-gen
```

## Security Considerations

The tool is designed with security in mind:

- No credential storage
- All processing happens locally
- Direct communication with Azure AD
- No logging of sensitive information

## Contributing

The project is open source and contributions are welcome! Feel free to:

- Report issues
- Suggest features
- Submit pull requests
- Share your use cases

You can find the project on [GitHub](https://github.com/sanjaysingh/aad-jwt-gen).

## Conclusion

The AAD JWT Token Generator aims to simplify Azure AD token generation for developers and administrators. Whether you're testing APIs, debugging token issues, or automating authentication workflows, I hope this tool makes your work easier.

Try it out and let me know what you think! Your feedback will help shape future improvements. 