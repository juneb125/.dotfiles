{ pkgs ? import <nixpkgs> {}, ... }:
pkgs.mkShell rec {
  packages = with pkgs; [
    alejandra
    deadnix
    just
    lua-language-server
    nil
    shellcheck
    stylua
  ];

  shellHook = ''
    echo "the following packages are available:"
    i=""
    for i in ${builtins.toString packages}; do
      echo -e "- ''${i#*-}"
    done
    unset i
    echo ""
  '';
}
