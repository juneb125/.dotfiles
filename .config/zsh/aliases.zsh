# -- Aliases --

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias proj='cd ~/Desktop/Coding/ && ls -aG'

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
alias reg_vim='vim'

# Misc.
alias clr='clear'
alias scerr='scutil --error $?'
alias rebuild_nix_flake='darwin-rebuild switch --flake ~/.dotfiles/.config/nix-darwin#Junes-MacBook-Air'
alias nix_lib_repl='nix repl --expr "import <nixpkgs> {}"'
