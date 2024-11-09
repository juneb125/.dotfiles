# My zsh config file
# pretty much just all aliases

# navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias Dl='cd ~/Downloads'
alias Dt='cd ~/Desktop'
alias proj='cd ~/Desktop/Coding/ && ls -aG'

# 'ls' aliases
alias la='ls -aG'
alias ll='ls -lG'
alias lal='ls -alG'

# misc. aliases
alias dt='echo "\n$(date)" && echo "\n$(cal)"'
alias scerr='scutil --error $1'
alias cl='clear'
alias gs='git status'
alias gl='git log --graph'

alias vim='nvim'
alias vi='nvim'
