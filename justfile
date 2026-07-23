# inspired by github:isabelroses/dotfiles's justfile
# 'update' recipe from github:foo-dogsquared/nixos-config's justfile

just_dir := justfile_directory()

rebuild_cmd := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }
check_cmd := if os() == "macos" { "darwin-rebuild check" } else { "nixos-rebuild test" }

_default:
    @just --list --unsorted

# check if flake is okay
check name *args:
    sudo {{ check_cmd }} --flake "{{ just_dir }}#{{ name }}" --show-trace {{ args }}

# [nixos|darwin]-rebuild switch
switch name *args:
    sudo {{ rebuild_cmd }} switch --flake "{{ just_dir }}#{{ name }}" {{ args }}

# update flake.lock
update:
    git checkout -- flake.lock
    nix flake update

# nixpkgs garbage collect
gc:
    nix-collect-garbage --delete-older-than 3d
    nix store optimise

# evaluate a flake output
eval *args:
    nix eval {{ args }} --extra-experimental-features "nix-command flakes"

# start a nix repl
repl *args:
    nix repl {{ args }} --extra-experimental-features "flakes"
