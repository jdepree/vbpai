# Verification Checklist for volcanoarts Setup

## Pre-Implementation Verification

Before copying files to volcanoarts, verify:

- [ ] You have admin access to https://github.com/jdepree/volcanoarts
- [ ] The volcanoarts repository contains a static website (HTML/CSS/JS)
- [ ] You have git access to clone and push to the volcanoarts repository

## Implementation Verification

After copying files to volcanoarts:

### 1. Files Copied
- [ ] `.github/workflows/deploy-main.yml` exists in volcanoarts
- [ ] `.github/workflows/pr-preview.yml` exists in volcanoarts
- [ ] Both files are committed and pushed to main branch

### 2. Repository Settings
- [ ] GitHub Pages is enabled (Settings → Pages)
- [ ] Source is set to "GitHub Actions" or "gh-pages branch"
- [ ] Workflow permissions set to "Read and write permissions"
- [ ] "Allow GitHub Actions to create and approve pull requests" is enabled

### 3. Main Branch Deployment
- [ ] Check Actions tab - "Deploy Main Branch to GitHub Pages" workflow ran
- [ ] Workflow completed successfully (green checkmark)
- [ ] Visit https://jdepree.github.io/volcanoarts/ - site loads correctly
- [ ] gh-pages branch exists in the repository

### 4. PR Preview Deployment (Test)
- [ ] Created a test branch with a small change
- [ ] Opened a pull request
- [ ] "Deploy PR Preview" workflow ran and completed successfully
- [ ] Bot posted a comment with preview URL on the PR
- [ ] Preview URL works: https://jdepree.github.io/volcanoarts/pr-[NUMBER]/
- [ ] Preview shows the changes from the PR

### 5. PR Cleanup (Test)
- [ ] Closed the test pull request
- [ ] "Deploy PR Preview" cleanup job ran
- [ ] Preview directory was removed from gh-pages branch
- [ ] Preview URL no longer works (expected)

## Troubleshooting

If any step fails, refer to:
- `SETUP_VOLCANOARTS.md` - Troubleshooting section
- GitHub Actions logs in the Actions tab
- Workflow run details for error messages

## Success Criteria

✅ All checkboxes above are checked
✅ Main branch deploys automatically on push
✅ PRs get preview deployments with unique URLs
✅ Preview comments appear on PRs
✅ Previews clean up automatically when PRs close

---

**Once all items are verified, the setup is complete and ready for team use!**
