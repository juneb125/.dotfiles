{ inputs, outputs, ... }: let
  inherit (inputs) darwin;
  inherit (inputs.stdenv) isDarwin;

  # mostly from github:kclejeune/system/flake.nix#L55-68
  mkDarwinSystem = {
    system ? "aarch64-darwin",
    nixpkgs ? inputs.nixpkgs,
    modules ? [],
    specialArgs ? {},
  }:
    darwin.lib.darwinSystem {
      inherit system modules;
      specialArgs = {inherit inputs outputs nixpkgs;} // specialArgs;
    };

  homePrefix =
    if isDarwin
    then "/Users"
    else "/home";
in {
  inherit mkDarwinSystem isDarwin homePrefix;
}
