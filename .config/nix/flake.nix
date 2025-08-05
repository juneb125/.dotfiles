{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-templates.url = "github:juneb125/ft";
  };

  outputs = inputs@{ self, nixpkgs, ... }: let
    inherit (self) outputs;
    utils = import ./lib {inherit inputs outputs;};
    inherit (utils) mkSystem forEachSystem;
  in {
    # see README.md for how to (re-)build darwin config
    darwinConfigurations."air" = mkSystem.darwin {
      modules = [
        ./config.nix
        ./darwin
        ./modules
      ];
    };

    devShells = forEachSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in import ./shells {inherit pkgs;});

    inherit (inputs.flake-templates) templates;
  };
}
