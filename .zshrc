# My zsh config file

# easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gp='cd ../..'
alias ggp='cd ../../..'

# navigation shortcuts
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

# misc. shortcuts
alias datetime='echo "\n$(date)" && echo "\n$(cal)"'
alias dt='echo "\n$(date)" && echo "\n$(cal)"'
alias vi='vim'

# when I configure nvim:
# alias vim='nvim'
# alias vi='nvim'

# export EDITOR='nvim'

# There are many other ways to customize your shell:
# - Set variables
# - Create aliases
# - Customize the prompt
# - Write handy functions
# - Change zsh options
# - Adjust history functionality
# - Improve line editor (completions, menu, navigation, etc.)
# - Add locations to $PATH variable 
# - Use zsh plugins
# - Change key bindings
# - Add "zstyles" for completions & more
