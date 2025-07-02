# Windows Dotfiles

A collection of configuration files for PowerShell, Neovim, and other development tools optimized for Windows.

## Prerequisites

- Windows 10/11
- [PowerShell 7+](https://github.com/PowerShell/PowerShell)
- [Scoop](https://scoop.sh) - A command-line installer for Windows

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

### 4. Create symbolic links

```powershell
# For PowerShell profile
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$HOME\.dotfiles\windows\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force

# For Neovim configuration
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$HOME\.dotfiles\windows\AppData\Local\nvim" -Force

# For bat configuration
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\bat" -Target "$HOME\.dotfiles\windows\scoop\apps\bat\current" -Force
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