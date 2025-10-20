# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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

# brew conf
export HOMEBREW_NO_ENV_HINTS=1

# ALIASES & FUNCTIONS
# Modern directory commands
alias cd=z
alias rm=trash
alias ls="eza -al --group-directories-first --icons"
alias lst="eza --tree --level=2 --icons"

# Utility shortcuts
alias ss="source ~/.zshrc"
alias ld=lazydocker
alias lg=lazygit
alias docker-compose="COMPOSE_BAKE=true docker-compose"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcuf="docker compose up -d --force-recreate"
alias dcd="docker compose down"
alias dex="docker exec -it"
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

#fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx

cursor() {
  nohup /home/"$(whoami)"/Applications/squashfs-root/AppRun -no-sandbox "$@" > /dev/null 2>&1 & disown
}

# Docker compose down with volumes (with warning)
dcdv() {
  echo "WARNING: This will remove containers AND volumes (data will be lost!)"
  echo "Are you sure you want to continue? [y/N]"
  read -r response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    command docker compose down -v "$@"
  else
    echo "Cancelled."
  fi
}

# Docker wrapper to intercept dangerous commands
docker() {
  local args=("$@")
  
  # Check if this is a "compose down -v" command
  if [[ "$1" == "compose" && "$2" == "down" ]]; then
    local has_volume_flag=false
    for arg in "${args[@]:2}"; do
      if [[ "$arg" == "-v" || "$arg" == "--volumes" ]]; then
        has_volume_flag=true
        break
      fi
    done
    
    if [[ "$has_volume_flag" == true ]]; then
      echo "WARNING: This will remove containers AND volumes (data will be lost!)"
      echo "Are you sure you want to continue? [y/N]"
      read -r response
      if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Cancelled."
        return 1
      fi
    fi
  fi
  
  # Execute the actual docker command
  command docker "$@"
}


TERM=xterm-256color
