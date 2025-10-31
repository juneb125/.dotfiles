export XDG_DATA_HOME=${XDG_DATA_HOME:-${HOME}/.local/share}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.dotfiles/config}
export XDG_STATE_HOME=${XDG_STATE_HOME:-${HOME}/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-${HOME}/.cache}

source "${HOME}/.cargo/env"

source "${HOME}/.local/share/bob/env/env.sh"

export EDITOR="nvim"

# make 100% sure Nix is in PATH
PATH="/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"

if [[ $(which bat) ]]; then
	export BAT_THEME="Catppuccin Macchiato"
fi
