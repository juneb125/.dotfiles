{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [
    alejandra
    deadnix
    just
    lua-language-server
    nil
    shellcheck
    stylua
  ];
}
