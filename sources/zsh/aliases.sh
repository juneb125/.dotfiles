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

# Git
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
# see Credits #3
alias gl="git log --graph --pretty=format:'%C(yellow)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'"
alias gp='git push'
alias gs='git status'

# Misc.
alias c='clear'
alias e='exit 0'
alias restart='reset'
alias notes='cd ~/Documents/"Obsidian Vault"'

if which tree >/dev/null; then
  alias tree="tree --gitignore --dirsfirst -F"
fi
