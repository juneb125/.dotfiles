{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    alejandra
    just
    shellcheck
  ];
}
