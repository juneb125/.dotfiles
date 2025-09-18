. "$HOME/.cargo/env"

. "${HOME}/.local/share/bob/env/env.sh"

export EDITOR="nvim"

# make 100% sure Nix is in PATH
PATH="/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"

# make sure ghcup is in PATH
PATH="${HOME}/.ghcup/bin:$PATH"
