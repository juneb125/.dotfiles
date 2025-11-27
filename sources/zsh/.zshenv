export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.dotfiles/sources"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

if [[ -e "${HOME}/.cargo/env" ]]; then
  source "${HOME}/.cargo/env"
fi

if [[ -e "${XDG_DATA_HOME}/bob/env/env.sh" ]]; then
  source "${XDG_DATA_HOME}/bob/env/env.sh"
fi

export EDITOR="nvim"
alias nvim='bob run nightly'

# make 100% sure Nix is in PATH
PATH="/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"

export FLAKE_HOME="${HOME}/.dotfiles"

if which bat > /dev/null; then
  export BAT_THEME="Catppuccin Macchiato"
fi
