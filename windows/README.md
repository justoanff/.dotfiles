# Windows Dotfiles

Concise setup for Windows with PowerShell, Scoop, and automated symlinks.

## Prerequisites
- Windows 10/11
- PowerShell 7+
- Scoop (`https://scoop.sh`)
- Recommend: enable Developer Mode (or run PowerShell as Administrator) to create symlinks

## Install
```powershell
git clone https://github.com/YOUR_USERNAME/.dotfiles.git $HOME\.dotfiles
cd $HOME\.dotfiles

# Scoop (if needed)
irm get.scoop.sh | iex
scoop bucket add extras; scoop bucket add nerd-fonts

# Restore apps (optional)
scoop import $HOME\.dotfiles\windows\scoop_backup.json
```

## Create symlinks (automated)
Use the script; it is idempotent and supports backup/force.
```powershell
# Preview
pwsh -File windows/setup-symlinks.ps1 -DryRun
# Apply
pwsh -File windows/setup-symlinks.ps1
# Overwrite instead of backing up
pwsh -File windows/setup-symlinks.ps1 -Force
```

## Verify
```powershell
(Get-Item $env:LOCALAPPDATA\nvim).Target
```

## Troubleshooting
- Symlink creation fails: enable Developer Mode or run as Administrator
- Terminal icons: install a Nerd Font and select it in your terminal