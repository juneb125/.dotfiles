{ inputs, outputs, ... }: let
  # mostly from github:kclejeune/system/flake.nix#L55-68
  mkDarwinSystem = {
    system ? "aarch64-darwin",
    nixpkgs ? inputs.nixpkgs,
    modules ? [],
    specialArgs ? {},
  }:
    inputs.darwin.lib.darwinSystem {
      inherit system modules;
      specialArgs = {inherit inputs outputs nixpkgs;} // specialArgs;
    };
  # more functions coming soon...
in {
  inherit mkDarwinSystem;
}
