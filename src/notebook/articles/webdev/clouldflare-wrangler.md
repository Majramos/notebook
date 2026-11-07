---
draft: false
date: 2026-11-01
tags:
  - cloudflare
  - pages
  - wrangler
links:
  - articles/webdev/clouldflare-account-id.md
  - Cloudflare/Create API token: https://developers.cloudflare.com/fundamentals/api/get-started/create-token/
---
# Using cloudflare wrangler to deploy a pages project

## Prerequisites and Setup
Install Node.js (v18+) and Wrangler, the official Cloudflare Developer Platform CLI. You can install Wrangler globally or run it via npx:

```bash
# Global installation (optional)
npm install -g wrangler

# Verify installation
wrangler --version
```

Authenticate Wrangler with your Cloudflare account:
```bash
wrangler login
# or
wrangler login  --device
```
*This opens a browser window prompting you to authorize Wrangler with your Cloudflare credentials.*

## Create the Pages Project
Create a named Pages project beforehand to define your production branch:
```bash
wrangler pages project create <PROJECT_NAME> --production-branch main
```

## Deploy to Cloudflare Pages
Deploy your build directory using the wrangler pages deploy command:
```bash
# General syntax
wrangler pages deploy <OUTPUT_DIRECTORY> --project-name=<PROJECT_NAME>

# Example for a Vite/React build output to 'dist'
wrangler pages deploy dist --project-name=my-website
```

### Common Deployment Flags
- Target a specific branch (Preview vs Production):
```bash
wrangler pages deploy dist --project-name=my-website --branch=main
```
Deploying to your designated production branch (e.g., main) publishes to your primary <PROJECT_NAME>.pages.dev URL, while other branches generate unique preview URLs.

- Attach a commit message:
```bash
wrangler pages deploy dist --project-name=my-website --commit-message="Release v1.0.0"
```

## CI/CD and Headless Deployments
For automated pipelines (e.g., GitLab CI or GitHub Actions), bypass browser authentication by exporting environment variables with an API token created in your Cloudflare dashboard:
```bash
export CLOUDFLARE_API_TOKEN="your_api_token"
export CLOUDFLARE_ACCOUNT_ID="your_account_id"

npx wrangler pages deploy dist --project-name=my-website --branch=main
```
