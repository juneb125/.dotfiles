{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = inputs@{ self, darwin, nixpkgs }:
  let
		inherit (self) outputs;
		# system = "aarch64-darwin";
		# pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # (re-)build darwin flake using:
    # $ darwin-rebuild switch --flake path/to/nix-darwin#Your-Flake-Name
    darwinConfigurations."Junes-MacBook-Air" = darwin.lib.darwinSystem {
			system = "aarch64-darwin";
			modules = [ ./config.nix ];
			specialArgs = { inherit inputs outputs; };
    };
  };
}
