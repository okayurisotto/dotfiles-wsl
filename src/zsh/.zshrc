# config {{{

autoload -U compinit && compinit
bindkey -e
eval "$(starship init zsh)"
zstyle ':completion:*' menu select

# }}}

# aliases {{{

alias clip='win32yank.exe'
alias fzf="fzf --color='prompt:cyan,pointer:cyan,marker:cyan,gutter:-1'"
alias grep='ripgrep'
alias icat='mpv --pause'
alias ls='exa'
alias mpv='mpv.exe'
alias tree='exa --tree'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

function g() {
  if [[ `pwd -P` == /mnt/* ]]; then
    git.exe "$@"
  else
    git "$@"
  fi
}

# }}}

# tmux {{{
# https://qiita.com/ssh0/items/a9956a74bff8254a606a

if [[ -z "$TMUX" ]]; then
  sessions="$(tmux list-sessions 2> /dev/null)"
  create_new_session='Create new session'

  if [[ -z $sessions ]]; then
    message="$create_new_session"
  else
    message="$sessions\n$create_new_session"
  fi

  id="$(echo "$message" | fzf --layout=reverse | sed 's/:.*//')"

  [[ "$id" = "$create_new_session" ]] && tmux new-session             && exit
  [[ -n "$id"                      ]] && tmux attach-session -t "$id" && exit
  : # Start terminal normally
fi

# }}}

# SSH {{{

# https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows

env="$HOME/.ssh/agent.env"

[[ -f "$env" ]] && . "$env" &> /dev/null

agent_run_state="$(ssh-add -l &> /dev/null; echo $?)"
# 0: agent running with key
# 1: agent running without key
# 2: agent not running

if [[ ! "$SSH_AUTH_SOCK" ]] || [[ "$agent_run_state" = '2' ]]; then
  umask 077
  ssh-agent > "$env" 2> /dev/null
  . "$env" > /dev/null

  ssh-add
elif [[ "$SSH_AUTH_SOCK" ]] && [[ "$agent_run_state" = '1' ]]; then
  ssh-add
fi

unset agent_run_state
unset env

# }}}
