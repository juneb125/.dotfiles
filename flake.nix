{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-templates.url = "github:juneb125/ft";
  };

  outputs = inputs@{ self, nixpkgs, ... }: let
    utils = import ./lib {flake = self;};
    inherit (utils) mkDarwinSystem forEachDefaultSystem;
  in {
    # see README.md for how to (re-)build darwin config
    darwinConfigurations."air" = mkDarwinSystem {
      modules = [ ./profiles/air.nix ];
    };

    packages = forEachDefaultSystem (pkgs: {
      pict = pkgs.callPackage ./pkgs/pict.nix {};
      tree = pkgs.callPackage ./pkgs/tree.nix {};
    });

    devShells = forEachDefaultSystem (pkgs: {
      default = import ./shell.nix {inherit pkgs;};
    });

    inherit (inputs.flake-templates) templates;
  };
}
