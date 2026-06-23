flake @ { inputs, outputs, ... }: let
  inherit (inputs) nixpkgs darwin;
in rec {
  mkSystem = class: {
    modules ? [],
    specialArgs ? {},
    ...
  }: let
    fn_dict = {
      darwin = darwin.lib.darwinSystem;
      nixos = nixpkgs.lib.nixosSystem;
    };
  in
    assert builtins.hasAttr "${class}" fn_dict || throw "invalid class argument: ${class}";
      fn_dict."${class}" {
        inherit modules;
        specialArgs = {inherit flake inputs outputs nixpkgs;} // specialArgs;
      };

  mkDarwinSystem = mkSystem "darwin";
  mkNixosSystem = mkSystem "nixos";

  inherit (inputs.stdenv) isDarwin;

  homePrefix =
    if isDarwin
    then "/Users"
    else "/home";

  defaultSystems = [
    "aarch64-darwin"
    "aarch64-linux"
    "x86_64-darwin"
    "x86_64-linux"
  ];
  forEachSystem = systems: f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
  forEachDefaultSystem = forEachSystem defaultSystems;
}
