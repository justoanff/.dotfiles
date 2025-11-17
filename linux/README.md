## Linux Dotfiles

Concise setup for a modern terminal/dev environment on Linux.

### What’s here
- `Brewfile` (Homebrew packages)
- `.zshrc` (Starship, zoxide, fzf, mise, bat, aliases, Docker vars)
- `.config/` (configs for `nvim`, `tmux`, `starship`, `ghostty`, `zed`, `mise`, `bat` theme)
- `.docker/config.json`, `.gitconfig`, `.gitignore`, `.hushlogin`

### Prerequisites
- Git
- Homebrew (Linuxbrew) — see `https://brew.sh`
- GNU Stow

Initialize brew in your shell if needed:
```bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$([ -x /home/linuxbrew/.linuxbrew/bin/brew ] && /home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### Install packages
```bash
cd /home/justoanff/Desktop/personal-proj/.dotfiles/linux
brew bundle --file Brewfile
```
### Update Brewfile
```bash
cd ~/.dotfiles/macos
brew bundle dump --describe --file=~/Brewfile --force --no-vscode
```

### Link configs (recommended: GNU Stow)
```bash
cd /home/justoanff/Desktop/personal-proj/.dotfiles
stow -nvt "$HOME" linux   # preview
stow -vt  "$HOME" linux   # apply
exec zsh -l                # reload shell
```

### Troubleshooting
- Conflicts (existing files): backup then stow
  ```bash
  mv ~/.zshrc ~/.zshrc.bak && stow -vt "$HOME" linux
  ```
- Restow / Unstow
  ```bash
  stow -Rvt "$HOME" linux
  stow -Dvt "$HOME" linux
  ```
- Verify symlinks
  ```bash
  ls -l ~/.zshrc && readlink -f ~/.zshrc
  ```
- Fonts/icons: install a Nerd Font and select it in your terminal.


