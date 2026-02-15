# 📚 volcanoarts GitHub Pages Setup Documentation

This directory contains complete setup documentation and files for enabling GitHub Pages deployment (main branch + PR previews) in the volcanoarts repository.

## 🚀 Quick Start

**New to this?** Start here:
1. Read `volcanoarts-setup/QUICKSTART.md` (3-minute read)
2. Copy files from `volcanoarts-setup/.github/` to your volcanoarts repo
3. Follow the 3 steps in QUICKSTART.md
4. Done! ✅

## 📖 Documentation Files

### For Quick Implementation
| File | Purpose | When to Use |
|------|---------|-------------|
| `volcanoarts-setup/QUICKSTART.md` | Fast 3-step guide | Just want to get it working |
| `volcanoarts-setup/README.md` | Copy-paste commands | Need quick commands |

### For Detailed Setup
| File | Purpose | When to Use |
|------|---------|-------------|
| `SETUP_VOLCANOARTS.md` | Complete guide with all details | First-time setup or customization |
| `IMPLEMENTATION_SUMMARY.md` | High-level overview | Want to understand what this does |

### For Verification
| File | Purpose | When to Use |
|------|---------|-------------|
| `VERIFICATION.md` | Step-by-step checklist | After implementation to verify |

## 📁 Ready-to-Copy Files

```
volcanoarts-setup/
├── .github/
│   └── workflows/
│       ├── deploy-main.yml      ← Copy these to volcanoarts
│       └── pr-preview.yml       ← Copy these to volcanoarts
├── QUICKSTART.md               ← Start here!
└── README.md                   ← Quick commands
```

## 🎯 What This Enables

Once set up, your volcanoarts repository will:

✅ **Main Branch Deployment**
- Automatically deploys to: `https://jdepree.github.io/volcanoarts/`
- Updates on every push to main
- Live within 1-2 minutes

✅ **PR Preview Deployments**
- Each PR gets a unique URL: `https://jdepree.github.io/volcanoarts/pr-[NUMBER]/`
- Bot comments on PRs with preview links
- Auto-updates when PR is updated
- Auto-cleanup when PR is closed

## 🛠️ Implementation Path

### Path 1: Quick Setup (5 minutes)
```bash
# 1. Copy files
cd /path/to/volcanoarts
cp -r /path/to/vbpai/volcanoarts-setup/.github .

# 2. Commit and push
git add .github/
git commit -m "Add GitHub Pages deployment workflows"
git push origin main

# 3. Configure settings (in GitHub UI)
# - Settings → Pages → Source: "GitHub Actions"
# - Settings → Actions → Workflow permissions: "Read and write"
```

### Path 2: Detailed Setup (15 minutes)
1. Read `SETUP_VOLCANOARTS.md` completely
2. Follow step-by-step instructions
3. Test with a sample PR
4. Use `VERIFICATION.md` to confirm everything works

## 📋 Recommended Reading Order

1. **Start**: `volcanoarts-setup/QUICKSTART.md`
2. **If you need more details**: `SETUP_VOLCANOARTS.md`
3. **After setup**: `VERIFICATION.md`
4. **For understanding**: `IMPLEMENTATION_SUMMARY.md`

## 🔍 Quick Reference

### URLs After Setup
- Main: `https://jdepree.github.io/volcanoarts/`
- PR #1: `https://jdepree.github.io/volcanoarts/pr-1/`
- PR #N: `https://jdepree.github.io/volcanoarts/pr-N/`

### Required Settings
- ✅ GitHub Pages enabled (Settings → Pages)
- ✅ Source set to "GitHub Actions"
- ✅ Workflow permissions: "Read and write"
- ✅ Allow GitHub Actions to create and approve PRs

### Files to Copy
```bash
volcanoarts-setup/.github/workflows/deploy-main.yml
volcanoarts-setup/.github/workflows/pr-preview.yml
```

## ❓ Common Questions

**Q: Do I need to modify the workflow files?**
A: No! They work as-is. Just copy them to your volcanoarts repo.

**Q: What if volcanoarts has a build step?**
A: See the "Build Steps" section in `SETUP_VOLCANOARTS.md`

**Q: Will this interfere with existing GitHub Pages?**
A: No, it will replace/enhance the current setup safely.

**Q: Can I test before applying to production?**
A: Yes! Create a test PR to see previews before merging.

## 🐛 Troubleshooting

If something doesn't work:
1. Check `SETUP_VOLCANOARTS.md` → Troubleshooting section
2. Verify all settings in GitHub repository settings
3. Check GitHub Actions logs for specific errors
4. Use `VERIFICATION.md` to identify what's missing

## 📞 Support

All documentation is self-contained in this directory:
- Setup guides
- Troubleshooting tips
- Verification checklists
- Example configurations

## ✅ Ready to Start?

👉 **Open `volcanoarts-setup/QUICKSTART.md` and follow the 3 steps!**

---

*This setup mirrors the proven configuration in the vbpai repository, which successfully deploys both main branch and PR previews.*
