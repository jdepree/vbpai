# Setting Up GitHub Pages PR Deployments for volcanoarts

This guide will help you set up GitHub Pages deployment for both the main branch and pull request previews in the volcanoarts repository, similar to the vbpai repository.

## Overview

This setup will:
- Automatically deploy the main branch to the root of your GitHub Pages site
- Create preview deployments for each pull request with unique URLs
- Post comments on PRs with preview links
- Automatically clean up previews when PRs are closed

## Prerequisites

1. The volcanoarts repository must be hosted on GitHub
2. You must have admin access to the repository
3. The repository should contain static HTML/CSS/JS files ready to deploy

## Step 1: Enable GitHub Pages

1. Go to your volcanoarts repository on GitHub
2. Click **Settings** → **Pages**
3. Under **Source**, select **"GitHub Actions"** (recommended) or **"Deploy from a branch"** and choose **gh-pages**
4. Click **Save**

## Step 2: Configure Workflow Permissions

1. In your volcanoarts repository, go to **Settings** → **Actions** → **General**
2. Scroll down to **Workflow permissions**
3. Select **"Read and write permissions"**
4. Check **"Allow GitHub Actions to create and approve pull requests"**
5. Click **Save**

## Step 3: Create GitHub Actions Workflows

Create the `.github/workflows` directory in your volcanoarts repository if it doesn't exist:

```bash
mkdir -p .github/workflows
```

Then create two workflow files:

### File 1: `.github/workflows/deploy-main.yml`

This workflow deploys the main branch to the root of your GitHub Pages site.

```yaml
name: Deploy Main Branch to GitHub Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: write

jobs:
  deploy-main:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout main branch
        uses: actions/checkout@v4

      - name: Deploy to GitHub Pages root
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: .
          destination_dir: .
          keep_files: true
          exclude_assets: >-
            .github, node_modules, .git, .gitattributes, .gitignore,
            package.json, package-lock.json
```

### File 2: `.github/workflows/pr-preview.yml`

This workflow creates preview deployments for pull requests.

```yaml
name: Deploy PR Preview

on:
  pull_request:
    types: [opened, synchronize, reopened, closed]

permissions:
  contents: write
  pull-requests: write

jobs:
  deploy-preview:
    runs-on: ubuntu-latest
    if: github.event.action != 'closed'
    
    steps:
      - name: Checkout PR branch
        uses: actions/checkout@v4
        
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: .
          destination_dir: pr-${{ github.event.pull_request.number }}
          keep_files: true
          exclude_assets: '.github,node_modules,.git,.gitattributes,.gitignore'
          
      - name: Comment PR with preview URL
        uses: actions/github-script@v7
        with:
          script: |
            const prNumber = context.payload.pull_request.number;
            const repoOwner = context.repo.owner;
            const repoName = context.repo.repo;
            const previewUrl = `https://${repoOwner}.github.io/${repoName}/pr-${prNumber}/`;
            
            const comment = `## 🚀 Preview Deployment
            
            Your preview is ready! Visit it at:
            
            **${previewUrl}**
            
            This preview will be updated automatically when you push new commits to this PR.`;
            
            // Find existing preview comment
            const { data: comments } = await github.rest.issues.listComments({
              owner: repoOwner,
              repo: repoName,
              issue_number: prNumber,
            });
            
            const botComment = comments.find(comment => 
              comment.user.type === 'Bot' && 
              comment.body.includes('Preview Deployment')
            );
            
            if (botComment) {
              // Update existing comment
              await github.rest.issues.updateComment({
                owner: repoOwner,
                repo: repoName,
                comment_id: botComment.id,
                body: comment
              });
            } else {
              // Create new comment
              await github.rest.issues.createComment({
                owner: repoOwner,
                repo: repoName,
                issue_number: prNumber,
                body: comment
              });
            }

  cleanup-preview:
    runs-on: ubuntu-latest
    if: github.event.action == 'closed'
    
    steps:
      - name: Checkout gh-pages branch
        uses: actions/checkout@v4
        with:
          ref: gh-pages
          
      - name: Remove PR preview directory
        run: |
          rm -rf pr-${{ github.event.pull_request.number }}
          git config user.name github-actions[bot]
          git config user.email 41898282+github-actions[bot]@users.noreply.github.com
          git add .
          git commit -m "Remove preview for PR #${{ github.event.pull_request.number }}" || echo "No changes to commit"
          git push
```

## Step 4: Commit and Push

1. Add the workflow files to your volcanoarts repository:
   ```bash
   git add .github/workflows/deploy-main.yml
   git add .github/workflows/pr-preview.yml
   git commit -m "Add GitHub Pages deployment workflows for main branch and PR previews"
   git push origin main
   ```

2. The main branch deployment will trigger automatically

## Step 5: Test the Setup

### Test Main Branch Deployment

1. Go to the **Actions** tab in your volcanoarts repository
2. You should see the "Deploy Main Branch to GitHub Pages" workflow running
3. Once complete, visit: `https://jdepree.github.io/volcanoarts/`

### Test PR Preview Deployment

1. Create a test branch:
   ```bash
   git checkout -b test-preview
   ```

2. Make a small change to any HTML file

3. Commit and push:
   ```bash
   git add .
   git commit -m "Test preview deployment"
   git push origin test-preview
   ```

4. Open a pull request on GitHub

5. Wait for the workflow to complete (check the Actions tab)

6. Look for a comment on your PR with the preview URL: `https://jdepree.github.io/volcanoarts/pr-[NUMBER]/`

7. Click the URL to verify your changes are visible

## URLs After Setup

- **Main branch**: `https://jdepree.github.io/volcanoarts/`
- **PR #1**: `https://jdepree.github.io/volcanoarts/pr-1/`
- **PR #2**: `https://jdepree.github.io/volcanoarts/pr-2/`
- And so on for each PR...

## Customization

### Excluding Additional Files

If you want to exclude additional files from deployment (like build artifacts or development files), update the `exclude_assets` line in the workflow files.

For example:
```yaml
exclude_assets: '.github,node_modules,.git,.gitattributes,.gitignore,README.md,docs'
```

### Build Steps

If your volcanoarts site requires a build step (like compiling TypeScript, Sass, or using a static site generator), add build steps before the deployment step:

```yaml
- name: Install dependencies
  run: npm install

- name: Build site
  run: npm run build

- name: Deploy to GitHub Pages
  uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./dist  # or wherever your build output goes
    ...
```

## Troubleshooting

### Workflow doesn't run
- Check that workflow permissions are set to "Read and write permissions" in Settings → Actions → General
- Verify the workflow files are in the correct location: `.github/workflows/`

### Preview URL doesn't work
- Wait a few minutes after the workflow completes
- Check that GitHub Pages is enabled in Settings → Pages
- Verify the gh-pages branch exists in your repository

### Permission errors
- Ensure "Read and write permissions" is enabled for workflows
- Check that "Allow GitHub Actions to create and approve pull requests" is checked

### Comment doesn't appear on PR
- Verify that the workflow has "pull-requests: write" permission
- Check the Actions tab for any error messages

## Maintenance

- Preview directories are automatically cleaned up when PRs are closed
- The main branch is automatically updated whenever you push to main
- No manual maintenance is required

## Additional Resources

- [GitHub Pages documentation](https://docs.github.com/en/pages)
- [peaceiris/actions-gh-pages](https://github.com/peaceiris/actions-gh-pages)
- [GitHub Actions documentation](https://docs.github.com/en/actions)
