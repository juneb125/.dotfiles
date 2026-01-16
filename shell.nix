{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = with pkgs; [
    alejandra
    just
    lua-language-server
    nil
    shellcheck
    stylua
  ];
}
