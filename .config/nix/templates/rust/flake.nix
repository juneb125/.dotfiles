{
  description = "Rust project flake template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forEachSystem = nixpkgs.lib.genAttrs systems;
		callPkg = sys: nixpkgs.legacyPackages.${sys}.callPackage;
	in {
    packages = forEachSystem (system: {
			default = callPkg system ./default.nix {};
    });
  };
}
