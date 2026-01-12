#!/usr/bin/env sh
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
alias gl='git log --graph'
alias gp='git push'
alias gs='git status'

# Misc.
alias c='clear'
alias e='exit 0'
alias scerr='scutil --error $?'
alias restart='reset'
alias notes='cd ~/Documents/"Obsidian Vault"'
# alias clang-c='clang -std=c99 -Wall -Werror '
