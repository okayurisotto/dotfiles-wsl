# Linuxbrew   ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# XDG Base Directory  ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# for applications    ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

export EDITOR="$(which nvim)"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

export FZF_DEFAULT_COMMAND="$(which fd) --no-follow"
export FZF_DEFAULT_OPTS="$(cat $XDG_CONFIG_HOME/fzf/config)"

# PATH    ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

prepend_path () {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="$1${PATH:+:$PATH}"
  esac
}

prepend_path "$HOME/.bin"
prepend_path "$HOME/.deno/bin"
prepend_path "$PNPM_HOME"

# Zsh settings    ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

autoload -U compinit && compinit
zstyle ':completion:*' menu select

bindkey -e

typeset -U PATH

eval "$(starship init zsh)"

# Alias   ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

alias clip='win32yank.exe'
alias grep='rg'
alias icat='mpv --pause=yes'
alias ls='exa --sort=Name'
alias mpv='mpv.exe'
alias t='tmux'
alias tree='exa --tree'
alias v='nvim'

function g() {
  if [[ `pwd -P` == /mnt/* ]]; then
    git.exe "$@"
  else
    git "$@"
  fi
}

# SSH ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

env="$HOME/.ssh/agent.env"

[[ -f "$env" ]] && . "$env" &> /dev/null

agent_run_state="$(ssh-add -l &> /dev/null; echo $?)"
# 0: agent is     running with    key!
# 1: agent is     running without key.
# 2: agent is not running            .

if [[ ! "$SSH_AUTH_SOCK" ]] || [[ "$agent_run_state" = '2' ]]; then
  umask 077
  ssh-agent > "$env" 2> /dev/null
  . "$env" > /dev/null

  ssh-add
elif [[ "$SSH_AUTH_SOCK" ]] && [[ "$agent_run_state" = '1' ]]; then
  ssh-add
fi

unset agent_run_state

# Misc    ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><> ><>

. /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh
