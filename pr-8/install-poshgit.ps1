# Install NuGet provider if needed
if (-not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
    Write-Host "Installing NuGet provider..."
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser
}

# Install posh-git
Write-Host "Installing posh-git..."
Install-Module posh-git -Scope CurrentUser -Force -SkipPublisherCheck

# Import posh-git
Import-Module posh-git

# Get PowerShell profile path
$profilePath = $PROFILE.CurrentUserAllHosts

# Create profile directory if it doesn't exist
$profileDir = Split-Path -Parent $profilePath
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}

# Add posh-git to profile if not already there
if (Test-Path $profilePath) {
    $profileContent = Get-Content $profilePath -Raw
    if ($profileContent -notmatch "Import-Module posh-git") {
        Write-Host "Adding posh-git to PowerShell profile..."
        Add-Content $profilePath "`n# Load posh-git for git autocomplete`nImport-Module posh-git"
    } else {
        Write-Host "posh-git already in profile"
    }
} else {
    Write-Host "Creating PowerShell profile and adding posh-git..."
    "# Load posh-git for git autocomplete`nImport-Module posh-git" | Out-File $profilePath -Encoding UTF8
}

Write-Host "`nSetup complete!"
Write-Host "posh-git installed and configured."
Write-Host "Restart PowerShell to enable git branch autocomplete."
Write-Host "`nYou can now use Tab to autocomplete:"
Write-Host "  - git checkout <Tab>  (branch names)"
Write-Host "  - git merge <Tab>     (branch names)"
Write-Host "  - git commands and options"
