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
    inherit (utils) mkDarwinSystem;
  in {
    # (re-)build darwin flake using:
    # $ darwin-rebuild switch --flake path/to/nix-darwin#Your-Flake-Name
    darwinConfigurations."Junes-MacBook-Air" = mkDarwinSystem {
      modules = [
        ./config.nix
        ./darwin
        ./modules
      ];
    };

    templates = import inputs.flake-templates {};
  };
}
