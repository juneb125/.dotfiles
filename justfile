# inspired by github:isabelroses/dotfiles's justfile
# 'update' recipe from github:foo-dogsquared/nixos-config's justfile

rebuild := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }
check := if os() == "macos" { "darwin-rebuild check" } else { "nixos-rebuild test" }

_default:
    @just --list --unsorted

# check if flake is okay
check name *args:
    sudo {{ check }} --flake ".#{{ name }}" --show-trace {{ args }}

# [nixos|darwin]-rebuild switch
switch name *args:
    sudo {{ rebuild }} switch --flake ".#{{ name }}" {{ args }}

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
