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

### 3. Create symbolic links

Use stow to create symbolic links for all configurations:

```bash
stow .
```

Alternatively, you can create symbolic links manually for specific configurations:

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