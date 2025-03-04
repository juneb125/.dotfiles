# -- Aliases --

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias proj='cd ~/Desktop/Coding/'
alias dotfiles='cd ~/.dotfiles'
alias config='cd ~/.dotfiles/.config'

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

# Misc.
alias c='clear'
alias clr='clear'
alias e='exit 0'
alias scerr='scutil --error $?'
alias rebuild-nix-flake='darwin-rebuild switch --flake ~/.dotfiles/.config/nix-darwin#Junes-MacBook-Air'
alias nix-lib-repl='nix repl --expr "import <nixpkgs> {}"'
alias clang-c='clang -std=c99 -Wall -Werror '
