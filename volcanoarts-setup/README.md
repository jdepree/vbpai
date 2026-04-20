# volcanoarts Repository Setup Files

This directory contains the GitHub Actions workflow files needed to set up GitHub Pages deployment for both the main branch and pull request previews in the volcanoarts repository.

## Quick Start

1. Copy the `.github` directory from this `volcanoarts-setup` folder to the root of your volcanoarts repository

2. Commit and push to main:
   ```bash
   cd /path/to/volcanoarts
   cp -r /path/to/vbpai/volcanoarts-setup/.github .
   git add .github/
   git commit -m "Add GitHub Pages deployment workflows"
   git push origin main
   ```

3. Configure repository settings:
   - Go to Settings → Pages → Source: select "GitHub Actions" or "gh-pages branch"
   - Go to Settings → Actions → General → Workflow permissions: select "Read and write permissions"
   - Enable "Allow GitHub Actions to create and approve pull requests"

4. Your main branch will deploy automatically to: `https://jdepree.github.io/volcanoarts/`

5. PRs will deploy to: `https://jdepree.github.io/volcanoarts/pr-[NUMBER]/`

## Files Included

- `.github/workflows/deploy-main.yml` - Deploys main branch to GitHub Pages root
- `.github/workflows/pr-preview.yml` - Deploys PR previews and cleans them up when closed

## Full Documentation

See `SETUP_VOLCANOARTS.md` in the parent directory for complete setup instructions, customization options, and troubleshooting tips.
