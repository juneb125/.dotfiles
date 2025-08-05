{ pkgs ? import <nixpkgs> {}, ... }: let
  inherit (pkgs) callPackage;
in rec {
  config = callPackage ./config.nix {};
  default = config;
  haskell = callPackage ./haskell.nix {};
	rust = callPackage ./rust.nix {};
}
