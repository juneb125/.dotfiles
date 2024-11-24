# My zsh config file

# prompt customization from:
# https://sureshjoshi.com/development/zsh-prompts-that-dont-suck#as-good-as-git-gets

# extensions to get git info (mainly vcs_info)
autoload -Uz add-zsh-hook vcs_info

# set prompt substitution so that we can use the vcs_message var
setopt prompt_subst

# style the vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git*' formats '%F{240}%b%c%f'

PS1='%n %2~ $vcs_info_msg_0_ > '
RPROMPT='%(?..[ %F{197}%?%f ])'

# get github token env var
source ~/.dotfiles/.env

# -- Aliases --
# navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias proj='cd ~/Desktop/Coding/ && ls -aG'

# 'ls' aliases
alias la='ls -aG'
alias ll='ls -lG'
alias lal='ls -alG'

# git aliases
alias ga='git add'
alias gb='git branch'
alias gs='git status'
alias gl='git log --graph'

# Vim/Nvim aliases
alias nv='nvim'
alias vi='nvim'
alias reg_vim='vim'

# misc. aliases
alias cl='clear'
