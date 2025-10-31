{ pkgs ? import <nixpkgs> {}, ... }: let
  inherit (pkgs) callPackage;
in rec {
  config = callPackage ./config.nix {};
  default = config;
  gleam = callPackage ./gleam.nix {};
  haskell = callPackage ./haskell.nix {};
  mdbook = callPackage ./mdbook.nix {};
  rust = callPackage ./rust.nix {};
}
