# My zsh config file

# -- History --
HISTDUP=erase
setopt append_history
setopt share_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# -- Options --
setopt correct
setopt correct_all

setopt no_case_glob

setopt prompt_subst

# -- Keybindings --
# bindkey <opts> '<keymap>' <widget>

# -- Prompt Customization --
# from: https://sureshjoshi.com/development/zsh-prompts-that-dont-suck#as-good-as-git-gets

autoload -Uz add-zsh-hook vcs_info

add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git*' formats '%F{240}%b%c%f'

PS1='%n %2~ $vcs_info_msg_0_ > '
RPROMPT='%(?..[ %F{197}%?%f ])'

# -- Misc. --
# get github token env var
source ~/.dotfiles/.env

# get aliases
source ~/.dotfiles/.aliases.zsh
