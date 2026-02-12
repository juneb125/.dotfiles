# Zsh config

# Prompt
export STARSHIP_CONFIG="${ZDOTDIR}/starship.toml"
if which starship >/dev/null; then
  [[ -f "${STARSHIP_CONFIG}" ]] \
    && eval "$(starship init zsh)"
fi

# Keybinds {{{
bindkey '^p' history-search-backward # <C-p>
bindkey '^n' history-search-forward  # <C-n>

# open buffer line in editor, see Credits #4
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line # <C-x><C-e>
# }}}

# History Opts {{{
HISTSIZE=10000
HISTFILE="${HOME}"/.zsh_history
SAVEHIST="${HISTSIZE}"
HISTDUP=erase
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# }}}

# Completions {{{
# load completions
autoload -U compinit && compinit

# enable case-insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# use completion menu
zstyle ':completion:*' menu select
# FIXME: $LS_COLORS empty ??
# color-coded completions :)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# complete path names, similar fmt to `ls -A` (true = similar fmt to `ls -Al`)
zstyle ':completion:*' file-list false
# }}}

# Misc. (non-plugin) {{{
# remove '/' and '_' from wordchars (old = '*?_-.[]~=/&;!#$%^(){}<>')
WORDCHARS='*?-.[]~=&;!#$%^(){}<>'

source "${ZDOTDIR}"/aliases.sh
source "${ZDOTDIR}"/fn.sh
source "${ZDOTDIR}"/net-utils.sh

if [[ "$(uname -s)" == Darwin* ]]; then
  source "${ZDOTDIR}"/macos.sh
fi
# }}}

# Zsh Plugins {{{
# 1. Initializing
# set the directory we want to store plugins
export ZPLUGINDIR="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh-plugins"
[[ -d "${ZPLUGINDIR}" ]] || mkdir -p "${ZPLUGINDIR}"

# helper function(s) for downloading plugins
source "${ZDOTDIR}"/get-plugins.zsh \
  || return 1 # error message is already in get-plugins.zsh

# 2. Downloading
# only download if plugin isn't installed
which zsh-syntax-highlighting >/dev/null \
  || get-syntax-highlighting

# 3. Sourcing -- must be at END of .zshrc
source "${ZPLUGINDIR}"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
