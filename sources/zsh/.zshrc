# Zsh config

# Prompt
export STARSHIP_CONFIG="${ZDOTDIR}"/starship.toml
if [[ ${commands[starship]} && -f "${STARSHIP_CONFIG}" ]]; then
  eval "$(starship init zsh)"
fi

# colors :D
export LS_COLORS='exfxcxdxbxegedabagacadah'
export CLICOLOR=1

# Keybinds {{{
# list all keybinds with 'bindkey -L'
bindkey '^P' history-search-backward # <C-p>
bindkey '^N' history-search-forward  # <C-n>
bindkey '^\ ' magic-space            # <C-<Space>>

# '^Xr' and '^X^R' for Redo complement '^Xu' and '^X^U' for Undo
bindkey '^Xr' redo  # <C-x>r (old = history-incremental-search-backward)
bindkey '^X^R' redo # <C-x><C-r> (old = _read_comp)

# open buffer line in editor, see Credits #4
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line # <C-x><C-e>
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

# Misc. {{{
# remove '/' and '_' from wordchars (old = '*?_-.[]~=/&;!#$%^(){}<>')
WORDCHARS='*?-.[]~=&;!#$%^(){}<>'

source "${ZDOTDIR}"/aliases.sh
source "${ZDOTDIR}"/fn.sh
source "${ZDOTDIR}"/net-utils.sh

if [[ "$(uname -s)" == Darwin* ]]; then
  source "${ZDOTDIR}"/macos.sh
fi
# }}}

# Completions {{{
# load completions
autoload -U compinit && compinit

# enable case-insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# use completion menu
zstyle ':completion:*' menu select
# color-coded completions for paths :)
COMP_LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)COMP_LS_COLORS}
# complete path names, similar fmt to `ls -A` (true = similar fmt to `ls -Al`)
zstyle ':completion:*' file-list false
# }}}

# Zsh Plugins {{{
# 1. Initializing
# set the directory we want to store plugins
export ZPLUGINDIR="${XDG_DATA_HOME:-${HOME}/.local/share}"/zsh-plugins
[[ -d "${ZPLUGINDIR}" ]] || mkdir -p "${ZPLUGINDIR}"

# helper function(s) for downloading plugins
source "${ZDOTDIR}"/get-plugins.zsh \
  || return 1 # error message is already in get-plugins.zsh

# 2. Downloading
# doesn't do anything if plugin is already installed
get-syntax-highlighting

# 3. Sourcing -- must be at END of .zshrc
source "${ZPLUGINDIR}"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
