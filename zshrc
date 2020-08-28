alias dev="mosh stev@165.232.51.207"
alias dotsync="~/.dotfiles/dotsync/bin/dotsync"
alias ..="cd .."
alias ...="cd ../.."
# alias ctags if installed using homebrew on macos
alias ctags="/usr/local/bin/ctags"

autoload -U compinit colors vcs_info
colors
compinit

REPORTTIME=3
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt CORRECT_ALL

# Disable autocorrect [nyae]
unsetopt correct

zstyle ':completion:*' completer _complete _correct _approximate 
zstyle ':vcs_info:*' stagedstr '%F{green}●%f '
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f '
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%F{blue}%b%f %u%c"

_setup_ps1() {
  vcs_info
  GLYPH="▲"
  [ "x$KEYMAP" = "xvicmd" ] && GLYPH="▼"
  PS1="%m %(?.%F{blue}.%F{red})$GLYPH%f %(1j.%F{cyan}[%j]%f .)%F{blue}%~%f %(!.%F{red}#%f .)"
  RPROMPT="$vcs_info_msg_0_"
}
_setup_ps1

# Vi mode
zle-keymap-select () {
 _setup_ps1
  zle reset-prompt
}
zle -N zle-keymap-select
zle-line-init () {
  zle -K viins
}
zle -N zle-line-init
bindkey -v
export KEYTIMEOUT=1

# Enable reverse search with tmux
bindkey '^R' history-incremental-search-backward

# user-friendly command output
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
