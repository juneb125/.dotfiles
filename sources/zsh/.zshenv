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
  alias nvim='bob run nightly'
fi
export EDITOR="nvim"

if [[ -d "${HOME}/.local/bin" && "${PATH}" != *"${HOME}/.local/bin"* ]]; then
  # where I keep my (very few) private scripts
  PATH="${HOME}/.local/bin:${PATH}"
fi

# make 100% sure Nix is in PATH, without inserting duplicates
if [[ "${PATH}" != */run/current-system/sw/bin* ]]; then
  PATH="/run/current-system/sw/bin:${PATH}"
fi
if [[ "${PATH}" != */nix/var/nix/profiles/default/bin* ]]; then
  PATH="/nix/var/nix/profiles/default/bin:${PATH}"
fi
export PATH

if [[ ${commands[ghostty]} && -x /usr/bin/manpath ]]; then
  # ghostty adds to MANPATH in a weird way
  export MANPATH="$(/usr/bin/manpath 2>/dev/null)"
fi

# where my system's flake.nix lives
export FLAKE_HOME="${HOME}/.dotfiles"
# where I keep my projects
export PROJ_DIR="${HOME}/Desktop/Coding"

export BAT_THEME="Catppuccin Macchiato"

# don't log less history
export LESSHISTFILE="/dev/null"

export JUNES_GITHUB_TOKEN="$(pass show personal/github-token | head -n1 2>/dev/null)"
