{ self, ... }: let
  inherit (self) inputs outputs;
  inherit (inputs) nixpkgs darwin;
in rec {
  # mostly from github:kclejeune/system/flake.nix#L55-68
  mkDarwinSystem = {
    system ? "aarch64-darwin",
    nixpkgs ? inputs.nixpkgs,
    modules ? [],
    specialArgs ? {},
    ...
  }:
    darwin.lib.darwinSystem {
      inherit system modules;
      specialArgs =
        {
          inherit inputs outputs nixpkgs;
          flake = self;
        }
        // specialArgs;
    };

  inherit (inputs.stdenv) isDarwin;

  homePrefix =
    if isDarwin
    then "/Users"
    else "/home";

  defaultSystems = [
    "aarch64-darwin"
    "aarch64-linux"
    "x86_64-darwin"
    "x86_64-linux"
  ];
  forEachSystem = systems: f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
  forEachDefaultSystem = forEachSystem defaultSystems;
}
