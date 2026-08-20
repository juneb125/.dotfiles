#!/bin/sh
#
# aliases.sh - shell aliases

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# 'ls'
alias la='ls -AG'
alias ll='ls -lG'
alias lal='ls -AlG'

# Git {{{1
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
# see Credits #3
alias gl="git log --graph --pretty=format:'%C(yellow)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'"
alias gll='git log'
alias gl1="git log --oneline"
alias gp='git push'
alias gs='git status'
alias gss='git status --short'

# Platform-specific {{{1
case "$(uname)" in
  *[dD]arwin*)
    # MacOS-specific
    alias copy='pbcopy'
    alias paste='pbpaste'
    ;;
  *[lL]inux*)
    # Linux-specific
    alias open='xdg-open'
    ;;
esac
# }}}1

# Misc.
alias c='clear'
alias e='exit 0'
alias restart='reset'
alias notes='cd ~/Documents/"Obsidian Vault"'
alias curlq='curl -fsSL' # [q]uiet curl
alias manout='MANPAGER="cat" MANWIDTH=${COLUMNS} man' # man page to stdout
alias untar='tar xf'

if which tree >/dev/null; then
  alias tree="command tree --gitignore -F"
fi

if which fastfetch >/dev/null; then
  alias ff='fastfetch'
fi

alias zen='open -a Zen.app'
