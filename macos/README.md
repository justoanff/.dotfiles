# Dotfiles

A collection of configuration files for zsh, tmux, neovim, and other development tools optimized for macOS.

## Prerequisites

- macOS
- [Homebrew](https://brew.sh/)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install Homebrew packages

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages from Brewfile
brew bundle
```

### 3. Create symbolic links (recommended via GNU Stow)

- Install Stow: `brew install stow`
- Recommendation: only stow the `macos` package into `$HOME` (safer, better scope control).

Preview (dry run):
```bash
cd ~/.dotfiles && stow -n -v -t ~ macos
```

Apply:
```bash
cd ~/.dotfiles && stow -v -t ~ macos
```

Alternatively, if you're already inside `~/.dotfiles/macos`:
```bash
cd ~/.dotfiles/macos && stow -n -v -t ~ .   # preview
cd ~/.dotfiles/macos && stow -v -t ~ .      # apply
```

If you don't use Stow, you can create symlinks manually:

```bash
# Create config directories if they don't exist
mkdir -p ~/.config/tmux
mkdir -p ~/.config/nvim
mkdir -p ~/.config/starship

# Link configurations
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -sf ~/.dotfiles/.config/starship.toml ~/.config/starship.toml
# Add more symbolic links as needed
```

## Using GNU Stow effectively

- Common flags:
  - `-n` (dry run): print actions without changing anything.
  - `-v` (verbose): print detailed operations.
  - `-t <dir>` (target): where links are created, typically `~`.
  - `-d <dir>` (dir): directory containing packages (defaults to the current dir). Example: `stow -d ~/.dotfiles -t ~ macos`.
  - `-S` (default): stow (create links).
  - `-D`: unstow (remove links).
  - `-R`: restow (relink after layout changes).
  - `--adopt`: move existing files from target into the package in the repo (helpful when importing existing configs).
  - `--no-folding`: avoid directory folding; link individual files instead of a single directory link.

- Layout conventions:
  - The `macos` package should mirror the destination layout, e.g., `macos/.config/nvim`, `macos/.config/tmux`, etc.
  - Place a `.stow-local-ignore` in the package to ignore files you do not want to link (e.g., `.DS_Store`).

- Common operations:
  - Unstow: `stow -D -v -t ~ macos`
  - Restow after structure changes: `stow -R -v -t ~ macos`
  - Adopt existing files from `~` into the repo: `stow --adopt -v -t ~ macos`

- Platform notes:
  - macOS Apple Silicon: Homebrew lives at `/opt/homebrew`; if you link paths involving Homebrew, ensure they match (e.g., `$(brew --prefix)`).
  - Always run with `-n` first for safety.

### 4. Set up zsh as default shell

```bash
# Add Homebrew zsh to allowed shells
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells

# Set zsh as default shell
chsh -s $(brew --prefix)/bin/zsh
```

### 5. Build bat cache for custom theme

```bash
# Build the bat cache to apply the custom Tokyo Night theme
bat cache --build
```

## Features

- **Shell**: zsh with starship prompt
- **Terminal Multiplexer**: tmux with Tokyo Night theme
- **Text Editor**: Neovim configuration
- **Package Management**: Homebrew with Brewfile
- **Runtime Version Management**: mise for Python, Node.js, Java
- **Shell Enhancements**:
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zoxide for smart directory navigation
  - fzf for fuzzy finding
  - bat for better file viewing
  - eza for modern ls replacement

## Key Shortcuts and Aliases

### Shell Aliases

- `z` - Smart directory navigation (replaces cd)
- `ls` - Enhanced directory listing with icons
- `lst` - Tree view of directories
- `ss` - Source zsh configuration
- `ld` - Launch lazydocker
- `lg` - Launch lazygit
- `v` - Open neovim or vim
- `vf` - Fuzzy find and open files in neovim

### Tmux Shortcuts

- `Ctrl+a` - Prefix key
- `|` - Split window horizontally
- `-` - Split window vertically
- `Alt+h/j/k/l` - Navigate between panes
- `Prefix + r` - Reload tmux configuration

## Customization

You can customize any of these dotfiles to suit your preferences. After making changes, either run `stow .` again or update the symbolic links manually.

## Updating

```bash
cd ~/.dotfiles
git pull
brew bundle
stow .
```

## Exporting Homebrew Packages

To export all installed Homebrew formulae (command-line tools) and casks (GUI applications):

```bash
brew bundle dump --describe --file=~/.dotfiles/Brewfile --force
```

- `--describe` adds comments describing each package
- `--file=~/.dotfiles/Brewfile` specifies the output file path
- `--force` overwrites an existing Brewfile

### Reinstalling on Another Machine

To replicate your setup on a new machine:

1. Transfer the Brewfile to the new machine (or clone this repo)
2. Run:
   ```bash
   brew bundle --file=~/.dotfiles/Brewfile
   ```

### Listing Installed Packages Separately

If you prefer to list installed packages without creating a Brewfile:

```bash
# List all formulae (CLI tools)
brew list --formula

# List all casks (GUI applications)
brew list --cask
```
