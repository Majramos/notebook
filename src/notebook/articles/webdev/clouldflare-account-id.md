---
draft: false
date: 2026-11-07
tags:
  - cloudflare
links:
  - articles/webdev/clouldflare-wrangler.md
  - Cloudflare/Create API token: https://developers.cloudflare.com/fundamentals/api/get-started/create-token/
---

# Find Cloudflare Account ID
You can retrieve your Account ID either through the Cloudflare dashboard or via the Wrangler CLI.

## Option 1: Via the Dashboard
1. Log in to the Cloudflare Dashboard.
2. Navigate to Workers & Pages in the left sidebar.
3. Look at the right sidebar under Account Details to find and copy your Account ID (a 32-character hexadecimal string).
4. Alternatively, select any registered domain or zone; the Account ID appears on the right sidebar under the API section.

## Option 2: Via the Wrangler CLI
If you have already authenticated Wrangler via your browser, run:

```bash
npx wrangler whoami
```
*This command displays your logged-in account name, email, and associated Account ID in the terminal.*


## Create Scoped API Token
Creating a scoped API token follows the principle of least privilege.

### Step-by-Step Instructions
1. In the Cloudflare Dashboard, click your User Profile icon (top-right corner) and select My Profile.
2. Select API Tokens from the left navigation menu, then click Create Token.
3. Under Custom Token, click Get started.
4. Configure the token details:
  - Token name: e.g., Wrangler Pages Deployment.
  - Permissions: Select Account → Cloudflare Pages → Edit.
  - (Optional) If your project uses Pages Functions with Workers KV, D1, or R2, add Workers KV Storage → Edit or D1 → Edit.
  - Account Resources: Choose Include → Specific account → select your account.
5. Click Continue to summary, review the permissions, and click Create Token.
6. Copy and store the generated token immediately, as Cloudflare will not display it again.
