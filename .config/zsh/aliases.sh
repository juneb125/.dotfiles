#!/usr/bin/env sh
# -- Aliases --

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# 'ls'
alias la='ls -aG'
alias ll='ls -lG'
alias lal='ls -alG'

# Git
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --graph'
alias gp='git push'
alias gs='git status'

# Vim / Nvim
alias nv='nvim'
alias vi='nvim'
alias vim='nvim'

# Misc.
alias c='clear'
alias e='exit 0'
alias scerr='scutil --error $?'

if [ $(which bat) ]; then
	alias cat='bat --plain'
fi
# alias clang-c='clang -std=c99 -Wall -Werror '
