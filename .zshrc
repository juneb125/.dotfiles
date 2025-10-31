# Zsh config

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
source ~/.dotfiles/.config/nix/modules/shell/fn.sh

if [[ "$(uname -s)" == [dD]arwin* ]]; then
  source ~/.dotfiles/.config/nix/modules/shell/macos.sh
fi

# -- Zsh Plugins --

# Initializing
# set the directory we want to store plugins
export ZPLUGINDIR="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-plugins"
[[ -d ${ZPLUGINDIR} ]] || mkdir -p ${ZPLUGINDIR}

# helper function(s) for downloading plugins
source ~/.dotfiles/.config/zsh/get-plugins.zsh
if [[ ! $? ]]; then
  # error message is already in get-plugins.zsh
  return 1
fi

# Downloading
# only download if plugin isn't installed
which zsh-syntax-highlighting > /dev/null \
  || get-syntax-highlighting

# Sourcing -- must be at END of .zshrc
source ${ZPLUGINDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
