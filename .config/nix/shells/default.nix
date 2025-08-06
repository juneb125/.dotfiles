{ pkgs ? import <nixpkgs> {}, ... }: let
  inherit (pkgs) callPackage;
in rec {
  config = callPackage ./config.nix {};
  default = config;
  gleam = callPackage ./gleam.nix {};
  haskell = callPackage ./haskell.nix {};
  rust = callPackage ./rust.nix {};
}
