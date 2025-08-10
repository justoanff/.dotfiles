# Windows Dotfiles

A collection of configuration files for PowerShell, Neovim, and other development tools optimized for Windows.

## Prerequisites

- Windows 10/11
- [PowerShell 7+](https://github.com/PowerShell/PowerShell)
- [Scoop](https://scoop.sh) - A command-line installer for Windows
- Windows Developer Mode enabled (or run PowerShell as Administrator) to create symlinks
- Optional (for Neovim plugins):
  - Node.js LTS and Yarn for `markdown-preview.nvim`
  - WezTerm or Kitty for `image_preview.nvim`

## Installation

### 1. Clone the repository

```powershell
git clone https://github.com/YOUR_USERNAME/.dotfiles.git $HOME\.dotfiles
cd $HOME\.dotfiles
```

### 2. Install Scoop (if not already installed)

```powershell
# Install Scoop
irm get.scoop.sh | iex

# Add extra buckets
scoop bucket add extras
scoop bucket add nerd-fonts
```

### 3. Install packages from scoop_backup.json

```powershell
scoop import $HOME\.dotfiles\windows\scoop_backup.json
```

### 4. Create symbolic links (automated)

Use the provided script to create all symlinks safely (idempotent, supports backup and force-overwrite):

```powershell
# Dry run (preview actions)
pwsh -File windows/setup-symlinks.ps1 -DryRun

# Execute
pwsh -File windows/setup-symlinks.ps1

# Overwrite existing real files/folders instead of backing up
pwsh -File windows/setup-symlinks.ps1 -Force
```

Notes:
- If not running as Administrator, enable Windows Developer Mode to allow symlink creation without admin rights.
- The script links:
  - `windows/AppData/Local/nvim` → `%LOCALAPPDATA%\nvim`
  - `windows/Documents/PowerShell/Microsoft.PowerShell_profile.ps1` → `%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`
  - `windows/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1` → `%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
  - `windows/.config` → `%USERPROFILE%\.config`
  - `windows/scoop/apps/bat/current/themes` → `%SCOOP%\apps\bat\current\themes` (fallback `%USERPROFILE%\scoop\apps\bat\current\themes`)
  - `windows/scoop/apps/bat/current/config` → `%SCOOP%\apps\bat\current\config` (fallback `%USERPROFILE%\scoop\apps\bat\current\config`)

Optional (bat configuration – manual):

```powershell
# Themes
New-Item -ItemType SymbolicLink -Path "$env:SCOOP\apps\bat\current\themes" -Target "$HOME\.dotfiles\windows\scoop\apps\bat\current\themes" -Force

# Config
New-Item -ItemType SymbolicLink -Path "$env:SCOOP\apps\bat\current\config" -Target "$HOME\.dotfiles\windows\scoop\apps\bat\current\config" -Force

# If $env:SCOOP is not set, replace with "$env:USERPROFILE\scoop"
```

### 5. Build bat cache for custom theme

```powershell
bat cache --build
```

## Features

- **Shell**: PowerShell 7+ with Oh My Posh prompt
- **Text Editor**: Neovim configuration
- **Package Management**: Scoop
- **Runtime Version Management**: mise for Python, Node.js, etc.
- **Shell Enhancements**:
  - PSReadLine for better command-line editing
  - zoxide for smart directory navigation
  - fzf for fuzzy finding
  - bat for better file viewing
  - eza for modern ls replacement

## Key Shortcuts and Aliases

### PowerShell Aliases

- `z` - Smart directory navigation (replaces cd)
- `ls` - Enhanced directory listing with icons using eza
- `cd` - Enhanced to use zoxide's smart navigation

## Customization

You can customize any of these dotfiles to suit your preferences. After making changes, update the symbolic links manually.

## Updating

```powershell
cd $HOME\.dotfiles
git pull
```

## Verify symlinks

Quick check that links were created correctly:

```powershell
$repo = "$HOME/.dotfiles"
$maps = @(
  @{ Link = "$env:LOCALAPPDATA\nvim"; Target = "$repo\windows\AppData\Local\nvim" },
  @{ Link = "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"; Target = "$repo\windows\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" },
  @{ Link = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"; Target = "$repo\windows\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" },
  @{ Link = "$env:USERPROFILE\.config"; Target = "$repo\windows\.config" },
  @{ Link = "$env:SCOOP\apps\bat\current\themes"; Target = "$repo\windows\scoop\apps\bat\current\themes" },
  @{ Link = "$env:SCOOP\apps\bat\current\config"; Target = "$repo\windows\scoop\apps\bat\current\config" }
)
foreach ($m in $maps) {
  if (-not (Test-Path $m.Link)) { Write-Host "[FAIL] $($m.Link)" -ForegroundColor Red; continue }
  $gi = Get-Item $m.Link -Force
  $isLink = ($gi.Attributes -band [IO.FileAttributes]::ReparsePoint)
  $target = $gi.Target
  if (-not $target) { $target = (Resolve-Path $m.Link).Path }
  $ok = $isLink -and ($target -eq $m.Target)
  Write-Host ("[{0}] {1} -> {2}" -f ($ok?'OK':'FAIL'), $m.Link, $target) -ForegroundColor ($ok?'Green':'Yellow')
}
```

## Troubleshooting

- Symlink creation fails: Enable Windows Developer Mode or run PowerShell as Administrator.
- `markdown-preview.nvim` build issues: install Node LTS and Yarn, then `:Lazy sync` in Neovim.
- Image preview not showing: use WezTerm/Kitty as your terminal.

## Exporting Scoop Packages

To export all installed Scoop applications:

```powershell
scoop export > $HOME\.dotfiles\windows\scoop_backup.json
```

### Reinstalling on Another Machine

To replicate your setup on a new machine:

1. Transfer the scoop_backup.json to the new machine (or clone this repo)
2. Run:
   ```powershell
   scoop import $HOME\.dotfiles\windows\scoop_backup.json
   ```

### Listing Installed Packages Separately

If you prefer to list installed packages without creating a backup:

```powershell
# List all installed apps
scoop list
``` 