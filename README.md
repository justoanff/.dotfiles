# .dotfiles

A cross-platform dotfiles repository for managing development environments on both macOS and Windows.

## Overview

This repository contains configuration files, scripts, and setup instructions for:
- Terminal customizations
- Shell configurations (zsh for macOS, PowerShell for Windows)
- Neovim editor setup
- Package management (Homebrew for macOS, Scoop for Windows)
- Development tools and utilities

## Platform-Specific Setup

### macOS

The macOS configuration includes:
- zsh shell with starship prompt
- Homebrew package management
- tmux terminal multiplexer
- Neovim editor configuration
- mise for runtime version management

[View macOS Setup Instructions](macos/README.md)

### Windows

The Windows configuration includes:
- PowerShell 7+ with Oh My Posh
- Scoop package management
- Neovim editor configuration
- mise for runtime version management
- Terminal enhancements for PowerShell

[View Windows Setup Instructions](windows/README.md)

## Key Features

- **Cross-Platform Tools**: Many tools are available on both platforms, providing a consistent experience
- **Modern Terminal**: Enhanced terminal experience with themes, icons, and productivity improvements
- **Neovim Configuration**: Consistent text editing experience across platforms
- **Version Management**: mise for managing runtime versions (Python, Node.js, etc.)
- **Git Integration**: Consistent Git configuration and tools like lazygit

## Quick Start

1. Clone this repository:
   ```bash
   # On macOS
   git clone https://github.com/YOUR_USERNAME/.dotfiles.git ~/.dotfiles
   
   # On Windows
   git clone https://github.com/YOUR_USERNAME/.dotfiles.git $HOME\.dotfiles
   ```

2. Navigate to your platform-specific directory and follow the instructions in the respective README file.

## Sync Strategy

These dotfiles use a symlink approach to maintain configurations in a single repository while creating links to the appropriate system locations.

## License

This project is open-sourced under the MIT License.

## Acknowledgments

- Inspired by the dotfiles community
- Built with open-source tools and configurations 