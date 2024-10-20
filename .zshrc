# My zsh config file
# pretty much just all aliases

# easier navigation to parent, grandparent, etc. directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gp='cd ../..'
alias ggp='cd ../../..'

# navigation shortcuts to specific directories
alias Dl='cd ~/Downloads'
alias Dt='cd ~/Desktop'
alias projects='cd ~/Desktop/Coding/ && ls -aG'
alias proj='cd ~/Desktop/Coding/ && ls -aG'

# meant to be used as 'cd projects'
# alias projects='~/Desktop/Coding'

# 'ls' shortcuts
alias lg='ls -G'
alias ll='ls -lG'
alias la='ls -aG'
alias lal='ls -alG'
alias lcd='cd $1 && ls -G $1'
alias clad='cd $1 && ls -aG $1' # anagram/portmanteau of 'ls -a' and 'cd'

# misc. aliases
alias datetime='echo "\n$(date)" && echo "\n$(cal)"'
alias dt='echo "\n$(date)" && echo "\n$(cal)"'
alias scerr='scutil --error $1'
alias cl='clear'
alias gs='git status'

# when I configure nvim:
alias vim='nvim'
alias vi='nvim'

# default programs
# export EDITOR='nvim'
# export TERMINAL='warp'
# export BROWSER='arc'
