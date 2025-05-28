{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-templates.url = "github:juneb125/ft";
  };

  outputs = inputs@{ self, nixpkgs, ... }: let
    inherit (self) outputs;
    utils = import ./lib {inherit inputs outputs;};
    inherit (utils) mkDarwinSystem;

    pkgs-unstable = import inputs.nixpkgs-unstable {system = "aarch64-darwin";};
  in {
    # (re-)build darwin flake using:
    # $ darwin-rebuild switch --flake path/to/nix-darwin#Your-Flake-Name
    darwinConfigurations."Junes-MacBook-Air" = mkDarwinSystem {
      modules = [
        ./config.nix
        ./darwin
        ./modules
      ];
      specialArgs = {inherit pkgs-unstable;};
    };

    templates = import inputs.flake-templates {};
  };
}
