# Zsh config

# Zinit
# set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit, if it's not there yet
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

PATH="/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"
PS1="%2~ > "

source ~/.dotfiles/.env
source ~/.dotfiles/.aliases.zsh

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# load completions
autoload -U compinit && compinit

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/.config/zsh/main.toml)"
fi

# Keybinds
bindkey '^I' autosuggest-accept # tab
bindkey '^p' history-search-backward # ctrl p
bindkey '^n' history-search-forward # ctrl n

# History
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

# Completion Styling
# enables case-insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
