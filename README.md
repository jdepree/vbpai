# Village Bicycle Project Website

This is the website for the Village Bicycle Project - empowering communities through cycling.

## Live Website

The main branch is automatically deployed to GitHub Pages and is available at:

**https://jdepree.github.io/vbpai/**

Every time changes are merged to the main branch, the website is automatically updated within a few minutes.

## PR Preview Deployments

This repository is configured to automatically deploy pull request previews to GitHub Pages. This allows non-technical team members to preview changes before they're merged to the main branch.

### How It Works

When you open or update a pull request:
1. A GitHub Actions workflow automatically deploys your changes to a unique URL
2. A comment is posted on the PR with the preview link (e.g., `https://jdepree.github.io/vbpai/pr-123/`)
3. Each time you push new commits, the preview is automatically updated
4. When the PR is closed (merged or rejected), the preview is automatically cleaned up

### Setup Requirements

To enable PR preview deployments, ensure:

1. **GitHub Pages is enabled** in repository settings:
   - Go to Settings → Pages
   - Set Source to "GitHub Actions" or "gh-pages branch"
   - Save the configuration

2. **Workflow permissions are correct**:
   - Go to Settings → Actions → General
   - Under "Workflow permissions", ensure "Read and write permissions" is selected
   - Save the configuration

### Testing the Preview Feature

To test that previews are working:
1. Create a new branch and make a small change to any HTML file
2. Open a pull request
3. Wait for the GitHub Actions workflow to complete (check the "Actions" tab)
4. Look for the preview URL comment on your PR
5. Click the URL to see your changes live

### Manual Deployment

If you need to manually deploy changes, you can trigger the workflow from the Actions tab.

## Local Development

To work on the website locally:
1. Clone the repository
2. Open any HTML file in your browser
3. Make changes and refresh to see updates

No build process is required - this is a static HTML website.
