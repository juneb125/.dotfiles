{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    erlang_27
    gleam
    rebar3
  ];
}
