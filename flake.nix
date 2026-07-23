{
  description = "June's system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-templates.url = "github:juneb125/ft";
  };

  outputs = inputs@{ self, nixpkgs, ... }: let
    utils = import ./lib self;
    inherit (utils) mkDarwinSystem mkNixosSystem forEachDefaultSystem;
  in {
    # see README.md for how to (re-)build darwin config
    darwinConfigurations."air" = mkDarwinSystem {
      modules = [ ./profiles/air.nix ];
    };

    nixosConfigurations."wsl" = mkNixosSystem {
      modules = [ ./profiles/wsl.nix ];
    };

    packages = forEachDefaultSystem (pkgs: import ./pkgs pkgs);

    devShells = forEachDefaultSystem (pkgs: {
      default = import ./shell.nix {inherit pkgs;};
    });

    inherit (inputs.flake-templates) templates;
  };
}
