# from github:sioodmy/dotfiles@main (path: user/wrapped/bat/default.nix)
{ pkgs, ... }:
pkgs.symlinkJoin {
  name = "tree-wrapped";
  paths = [pkgs.tree];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/tree --add-flags "--dirsfirst"
  '';
}
