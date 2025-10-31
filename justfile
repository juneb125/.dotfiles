# inspired by github:isabelroses/dotfiles/justfile
# 'update' recipe from github:foo-dogsquared/nixos-config/Justfile

rebuild := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }
check := if os() == "macos" { "darwin-rebuild check" } else { "nixos-rebuild test" }

default:
    @just --list

# [nixos|darwin]-rebuild switch
switch name:
    sudo {{ rebuild }} switch --flake {{ name }}

# check if flake if okay
check name:
    sudo {{ check }} --flake {{ name }} --show-trace

# update & commit flake.lock
update:
    git checkout -- flake.lock
    nix flake update

# nixpkgs garbage collect
gc period:
    nix-garbage-collect --delete-older-than {{ period }}
