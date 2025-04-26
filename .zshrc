# SHELL PROMPT & THEMES
# Powerlevel10k configuration (commented out)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Load p10k config if exists
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Starship prompt
eval "$(starship init zsh)"

# ZSH PLUGINS
# Command suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Smart directory navigation
eval "$(zoxide init zsh)"

# mise
eval "$(mise activate zsh)"

# FZF CONFIGURATION
# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tokyo night theme with preview
export fzf_default_opts="
  --height 40%
  --layout=reverse
  --border=rounded
  --preview-window=right:60%
  --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -c {} | less)) || echo {} 2> /dev/null | head -200'
  --color=fg:#c0caf5,bg:-1,hl:#7aa2f7
  --color=fg+:#c0caf5,bg+:-1,hl+:#7dcfff
  --color=border:#7aa2f7,info:#7aa2f7,prompt:#7dcfff,pointer:#bb9af7
  --color=marker:#9ece6a,spinner:#bb9af7,header:#7aa2f7"

# file finding configuration
export fzf_default_command='fd --type f --hidden --follow --exclude .git'
export fzf_ctrl_t_command="$fzf_default_command"
export fzf_alt_c_command="fd --type d . --color=never"

# preview with bat
export BAT_THEME="tokyonight_night"
export bat_style="numbers,changes,header"
export manpager="sh -c 'col -bx | bat -l man -p'"

# Key bindings
bindkey '^T' fzf-file-widget
bindkey '^R' fzf-history-widget
bindkey '^[c' fzf-cd-widget

# DEV ENVIRONMENT
# docker buildkit
export docker_buildkit=1

# bake enable
export COMPOSE_BAKE=true

# ALIASES & FUNCTIONS
# Modern directory commands
alias cd=z
alias ls="eza --icons"
alias lst="eza --tree --level=2 --icons"

# Utility shortcuts
alias ss="source ~/.zshrc"
alias ld=lazydocker
alias lg=lazygit
alias docker-compose="COMPOSE_BAKE=true docker-compose"
alias docker compose="docker-compose"
alias ff=fastfetch

# Python wrapper
py() {
  if command -v python3 >/dev/null 2>&1; then
    python3 "$@"
  elif command -v python >/dev/null 2>&1; then
    python "$@"
  else
    echo "Python is not installed" >&2
    return 1
  fi
}

# Neovim/vim wrapper
unalias v 2>/dev/null
v() {
  if command -v nvim >/dev/null 2>&1; then
    nvim "$@"
  elif command -v vim >/dev/null 2>&1; then
    vim "$@"
  else
    echo "Neither nvim nor vim is installed!" >&2
    return 1
  fi
}

# FZF file finder
vf() {
  local file
  file=$(fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')
  [ -n "$file" ] && nvim "$file"
}
