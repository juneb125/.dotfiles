{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    mdbook
    mdbook-katex
  ];
}
