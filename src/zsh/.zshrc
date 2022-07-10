export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export EDITOR="$(which nvim)"

export PNPM_HOME="$XDG_DATA_HOME/pnpm"

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"

autoload -U compinit && compinit
bindkey -e
eval "$(starship init zsh)"
zstyle ':completion:*' menu select

alias clip='win32yank.exe'
alias fzf="fzf --color='prompt:cyan,pointer:cyan,marker:cyan,gutter:-1'"
alias grep='rg'
alias icat='mpv --pause'
alias ls='exa'
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

. /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh
