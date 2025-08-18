# .dotfiles

Best-practice, minimal guide to manage symlinks with GNU Stow in this repo.

## Prerequisites
- Git
- GNU Stow

Install Stow quickly:
```bash
# macOS (Homebrew)
brew install stow

# Debian/Ubuntu
sudo apt-get update && sudo apt-get install -y stow
```

## Symlink with Stow (run from repo root)
```bash
# macOS
stow -nvt "$HOME" macos && stow -vt "$HOME" macos

# Linux
stow -nvt "$HOME" linux && stow -vt "$HOME" linux

# Windows
# Prefer the PowerShell script: windows/setup-symlinks.ps1
# Or use Stow inside WSL targeting the WSL home.
```

## Common operations
```bash
# Restow (update links after changes)
stow -Rvt "$HOME" linux

# Unstow (remove links)
stow -Dvt "$HOME" linux
```

## Debugging
- Conflicts: backup/remove the real file, then stow again
  ```bash
  mv ~/.zshrc ~/.zshrc.bak && stow -vt "$HOME" linux
  ```
- Adopt existing files into the repo
  ```bash
  stow --adopt -vt "$HOME" linux && git add -A && git commit -m "chore(stow): adopt existing files"
  ```
- Verify symlinks
  ```bash
  ls -l ~/.zshrc && readlink -f ~/.zshrc
  ```
- Always run from repo root; set target to home with `-t "$HOME"`
- Use `.stow-local-ignore` inside a package (e.g. `linux/`) to skip files

## Platform docs
- macOS: `macos/README.md`
- Linux: `linux/README.md`
- Windows: `windows/README.md` (and `windows/setup-symlinks.ps1`)

## License
MIT