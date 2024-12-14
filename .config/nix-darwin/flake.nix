{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, darwin, nixpkgs }:
  let
		configuration = { pkgs, ... }: {
			imports = [
				(import ./config.nix { inherit self pkgs; })
			];
		};
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild switch --flake path/to/nix-darwin#Your-Flake-Name
    darwinConfigurations."Junes-MacBook-Air" = darwin.lib.darwinSystem {
			# system = "aarch64-darwin";
			modules = [ configuration ];
    };
  };
}
