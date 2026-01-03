{pkgs ? import <nixpkgs> {}, ...}: rec {
  config = pkgs.callPackage ./config.nix {};
  default = config;
}
