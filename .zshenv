source "${HOME}/.cargo/env"

source "${HOME}/.local/share/bob/env/env.sh"

export EDITOR="nvim"

# make 100% sure Nix is in PATH
PATH="/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"

if [[ $(which bat) ]]; then
	export BAT_THEME="Catppuccin Macchiato"
fi
