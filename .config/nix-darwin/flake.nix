{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = inputs@{ self, darwin, nixpkgs, nixpkgs-unstable, ... }:
  let
		inherit (self) outputs;
		# localHostName = "Junes-MacBook-Air";
		system = "aarch64-darwin";
  in
  {
    # (re-)build darwin flake using:
    # $ darwin-rebuild switch --flake path/to/nix-darwin#Your-Flake-Name
    darwinConfigurations."Junes-MacBook-Air" = darwin.lib.darwinSystem {
			inherit system;
			modules = [ ./config.nix ];
			specialArgs = {
				inherit inputs outputs;
				pkgs-unstable = import nixpkgs-unstable { system = system; };
			};
    };
  };
}
