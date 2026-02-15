# Quick Reference: volcanoarts GitHub Pages Setup

## 📋 Overview
This guide will set up your volcanoarts repository to deploy:
- **Main branch** → `https://jdepree.github.io/volcanoarts/`
- **Pull requests** → `https://jdepree.github.io/volcanoarts/pr-[NUMBER]/`

---

## 🚀 3-Step Setup

### Step 1: Copy Workflow Files
From your vbpai repository, copy the workflow files to volcanoarts:

```bash
# Navigate to volcanoarts repository
cd /path/to/volcanoarts

# Copy the .github directory from vbpai/volcanoarts-setup/
cp -r /path/to/vbpai/volcanoarts-setup/.github .

# Commit and push
git add .github/
git commit -m "Add GitHub Pages deployment workflows"
git push origin main
```

### Step 2: Configure Repository Settings

#### Enable GitHub Pages
1. Go to: https://github.com/jdepree/volcanoarts/settings/pages
2. Under **Source**, select: **"GitHub Actions"** (recommended) or **"Deploy from a branch"** → **gh-pages**
3. Click **Save**

#### Enable Workflow Permissions
1. Go to: https://github.com/jdepree/volcanoarts/settings/actions
2. Under **Workflow permissions**, select: **"Read and write permissions"**
3. Check: **"Allow GitHub Actions to create and approve pull requests"**
4. Click **Save**

### Step 3: Test the Setup

The main branch deployment will trigger automatically. To test PR previews:

```bash
# Create a test branch
git checkout -b test-preview

# Make a small change to any HTML file
echo "<!-- Test -->" >> index.html

# Commit and push
git commit -am "Test PR preview deployment"
git push origin test-preview

# Open a PR at: https://github.com/jdepree/volcanoarts/compare/main...test-preview
```

Wait for the workflow to complete, and you'll see a comment with the preview URL!

---

## 📁 Files Included

| File | Purpose |
|------|---------|
| `.github/workflows/deploy-main.yml` | Deploys main branch to root |
| `.github/workflows/pr-preview.yml` | Deploys PR previews with unique URLs |

---

## 🔗 Expected URLs

- **Main Branch**: https://jdepree.github.io/volcanoarts/
- **PR #1**: https://jdepree.github.io/volcanoarts/pr-1/
- **PR #2**: https://jdepree.github.io/volcanoarts/pr-2/
- **PR #N**: https://jdepree.github.io/volcanoarts/pr-N/

---

## ⚙️ How It Works

1. **Main Branch Deployment**: 
   - Triggers on every push to main
   - Deploys entire repository to GitHub Pages root
   - Available within 1-2 minutes

2. **PR Preview Deployment**:
   - Triggers when a PR is opened, updated, or closed
   - Deploys to a unique subdirectory: `pr-[NUMBER]`
   - Posts/updates a comment with the preview URL
   - Automatically cleans up when PR is closed

---

## 🛠️ Troubleshooting

**Workflow doesn't run?**
- ✅ Check workflow permissions are "Read and write"
- ✅ Verify files are in `.github/workflows/` directory

**Preview URL doesn't work?**
- ✅ Wait 2-3 minutes after workflow completes
- ✅ Check GitHub Pages is enabled in Settings
- ✅ Verify gh-pages branch exists

**No comment on PR?**
- ✅ Verify "pull-requests: write" permission is set
- ✅ Check Actions tab for error messages

---

## 📖 Full Documentation

For detailed information, customization options, and advanced setup, see:
- `SETUP_VOLCANOARTS.md` - Complete setup guide with customization options

---

## 🎯 Next Steps

After setup is complete:
1. ✅ Verify main branch deploys to https://jdepree.github.io/volcanoarts/
2. ✅ Test PR preview by creating a test PR
3. ✅ Update any documentation in volcanoarts to mention the preview feature
4. ✅ Share the preview feature with your team!

---

**Need help?** Check the full documentation in `SETUP_VOLCANOARTS.md`
