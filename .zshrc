# Zsh config

# make 100% sure Nix is in PATH
PATH="/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"

# Prompt
export STARSHIP_CONFIG=$HOME/.dotfiles/.config/zsh/starship.toml
eval "$(starship init zsh)"

# Keybinds
bindkey '^I' autosuggest-accept      # tab
bindkey '^p' history-search-backward # ctrl p
bindkey '^n' history-search-forward  # ctrl n

# History Opts
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completions
# load completions
autoload -U compinit && compinit

# enable case-insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Misc. (non-plugin)
source ~/.dotfiles/.env
source ~/.dotfiles/.config/zsh/aliases.zsh

# -- Zinit (plugin manager) --

# Initializing
# set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit, if it's not there yet
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
