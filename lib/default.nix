{ self, inputs, outputs, ... }: let
  inherit (inputs) nixpkgs darwin;
  inherit (inputs.stdenv) isDarwin;
in {
  # mostly from github:kclejeune/system/flake.nix#L55-68
  mkSystem = {
    darwin = {
      system ? "aarch64-darwin",
      nixpkgs ? inputs.nixpkgs,
      modules ? [],
      specialArgs ? {},
    }:
      darwin.lib.darwinSystem {
        inherit system modules;
        specialArgs = {inherit self inputs outputs nixpkgs;} // specialArgs;
      };
  };

  homePrefix =
    if isDarwin
    then "/Users"
    else "/home";

  inherit isDarwin;

  forEachSystem = f: nixpkgs.lib.genAttrs ["aarch64-darwin"] (system: f nixpkgs.legacyPackages.${system});
}
