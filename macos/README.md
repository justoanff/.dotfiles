# macOS Dotfiles

Concise setup for macOS using Homebrew, Zsh, Neovim, tmux, and friends.

## Prerequisites
- macOS
- Homebrew — see `https://brew.sh`
- GNU Stow: `brew install stow`

## Install packages
```bash
cd ~/.dotfiles/macos
brew bundle --file Brewfile  # or from repo root: brew bundle -v -d macos
```

## Link configs (GNU Stow)
```bash
cd ~/.dotfiles
stow -nvt "$HOME" macos   # preview
stow -vt  "$HOME" macos   # apply
```

## Optional
Set Zsh as default shell:
```bash
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"
```

## Troubleshooting
- Unstow / Restow
  ```bash
  stow -Dvt "$HOME" macos
  stow -Rvt "$HOME" macos
  ```
- Adopt existing files into the repo
  ```bash
  stow --adopt -vt "$HOME" macos && git add -A && git commit -m "chore(stow): adopt"
  ```
- Verify symlinks
  ```bash
  ls -l ~/.zshrc && readlink ~/.zshrc
  ```
