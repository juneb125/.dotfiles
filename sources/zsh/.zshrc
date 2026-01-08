# Zsh config

# Prompt
if [[ -f "${ZDOTDIR}/starship.toml" ]]; then
  export STARSHIP_CONFIG="${ZDOTDIR}/starship.toml"
fi
if which starship >/dev/null; then
  eval "$(starship init zsh)"
fi

# Keybinds
bindkey '^I' autosuggest-accept      # tab
bindkey '^p' history-search-backward # ctrl p
bindkey '^n' history-search-forward  # ctrl n

# open buffer line in editor, from
#   https://www.youtube.com/watch?v=3fVAtaGhUyU&t=95s
#   github:elliottminns/dotfiles@2c68576 (path: /.zshrc#L138-L141)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line # ctrl x, ctrl e

# History Opts
HISTSIZE=5000
HISTFILE=${HOME}/.zsh_history
SAVEHIST=${HISTSIZE}
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
source ${ZDOTDIR}/aliases.sh
source ${ZDOTDIR}/fn.sh
source ${ZDOTDIR}/net-utils.sh

if [[ "$(uname -s)" == [dD]arwin* ]]; then
  source ${ZDOTDIR}/macos.sh
fi

# -- Zsh Plugins --

# Initializing
# set the directory we want to store plugins
export ZPLUGINDIR="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-plugins"
[[ -d ${ZPLUGINDIR} ]] || mkdir -p ${ZPLUGINDIR}

# helper function(s) for downloading plugins
source ${ZDOTDIR}/get-plugins.zsh \
  || return 1 # error message is already in get-plugins.zsh

# Downloading
# only download if plugin isn't installed
which zsh-syntax-highlighting > /dev/null \
  || get-syntax-highlighting

# Sourcing -- must be at END of .zshrc
source ${ZPLUGINDIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
