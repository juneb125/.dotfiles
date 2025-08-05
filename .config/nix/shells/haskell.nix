{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    cabal-install
    ghc
    haskell-language-server
  ];
}
