{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-templates.url = "github:juneb125/ft";
  };

  outputs = inputs@{ self, nixpkgs, ... }: let
    utils = import ./lib {inherit self;};
    inherit (utils) mkDarwinSystem forEachDefaultSystem;
  in {
    # see README.md for how to (re-)build darwin config
    darwinConfigurations."air" = mkDarwinSystem {
      modules = [
        ./profiles/air.nix
      ];
    };

    devShells = forEachDefaultSystem (pkgs: {
      default = import ./shell.nix {inherit pkgs;};
    });

    inherit (inputs.flake-templates) templates;
  };
}
