typeset -A _kyoto
_kyoto[ZSH_HOME]="$HOME/.zsh"

# Keep this block at the top of this file, otherwise the prompt may not work properly
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $_kyoto[ZSH_HOME]/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

# Plugins and utilities sourcing
source $_kyoto[ZSH_HOME]/utils/time.zsh
source $_kyoto[ZSH_HOME]/plugins/zsh-notes/zsh-notes.plugin.zsh
source $_kyoto[ZSH_HOME]/plugins/colorize/colorize.plugin.zsh
source $_kyoto[ZSH_HOME]/plugins/zsh-bd/bd.plugin.zsh
source $_kyoto[ZSH_HOME]/plugins/zsh-command-not-found/command-not-found.plugin.zsh
source $_kyoto[ZSH_HOME]/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $_kyoto[ZSH_HOME]/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Define some aliases
alias nv='nvim'
alias l='ls'
alias cp='cp -v'
alias ls="ptls"
alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"
alias cp="ptcp"
alias rm="ptrm"
alias please="sudo"

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  alias ls='ls --color=always --group-directories'
  alias ll='ls -la --color=always --group-directories'
fi

# Useful keybindings
bindkey -e
bindkey '^w' forward-word
bindkey '^b' backward-word
bindkey '^d' kill-whole-line
bindkey '^k' backward-kill-word
bindkey '^j' kill-word

# Word completions
autoload -Uz compinit
autoload -U +X bashcompinit && bashcompinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SList: %p%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SList: %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Options
setopt prompt_subst
setopt promptsubst
setopt append_history
setopt extended_history
setopt sharehistory
setopt hist_reduce_blanks
setopt always_to_end
setopt complete_in_word
setopt auto_menu
setopt correct
setopt correctall
setopt noflowcontrol
setopt hist_verify
setopt list_packed

# List the files after a successful directory change
function chpwd() {
    emulate -L zsh
    # uses ptSh for better-looking stdout
    # You can put any argument you'd like for a different output
    ptls && ptpwd
}
