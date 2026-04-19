pkgs:
builtins.mapAttrs
  (_: val: pkgs.callPackage val {})
{
  pict = ./pict.nix;
  tree = ./tree.nix;
}

/*
  or alternatively...
  ```
  pkgs:
    pkgs.lib.genAttrs [ "pict" "tree" ]
      (file: pkgs.callPackage "./${file}.nix")
  ```
  ..., but the `builtins.mapAttrs` way allows more customization of package attr names and source files
*/
