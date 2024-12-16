# My zsh config file

export PATH="/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"
# $HOME/.nix-profile/bin
# /nix/var/nix/profiles/system/sw/bin

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
zstyle ':vcs_info:git*' formats '%F{black}%b%c%f'

autoload -U colors && colors
PS1='%F{magenta}%2~%f $vcs_info_msg_0_ > '

RPROMPT='%(?..%{$fg[red]%}[ %? ]%f)'

# -- Misc. --
# get github token env var
source ~/.dotfiles/.env

# get aliases
source ~/.dotfiles/.aliases.zsh
