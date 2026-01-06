export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.dotfiles/sources"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

if [[ -f "${HOME}/.cargo/env" ]]; then
  source "${HOME}/.cargo/env"
fi

if [[ -f "${XDG_DATA_HOME}/bob/env/env.sh" ]]; then
  source "${XDG_DATA_HOME}/bob/env/env.sh"
fi

export EDITOR="nvim"
alias nvim='bob run nightly'

# make 100% sure Nix is in PATH, without inserting duplicates
if [[ "${PATH}" != */run/current-system/sw/bin* ]]; then
  PATH="/run/current-system/sw/bin:${PATH}"
fi
if [[ "${PATH}" != */nix/var/nix/profiles/default/bin* ]]; then
  PATH="/nix/var/nix/profiles/default/bin:${PATH}"
fi
export PATH

export FLAKE_HOME="${HOME}/.dotfiles"
# where I keep my projects
export PROJ_DIR="${HOME}/Desktop/Coding"

if which bat >/dev/null; then
  export BAT_THEME="Catppuccin Macchiato"
fi

# don't log less history
export LESSHISTFILE="/dev/null"
