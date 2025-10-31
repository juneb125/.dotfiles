{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    cargo
    rustc
    rustfmt
  ];
}
