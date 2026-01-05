{
  imports = [
    ./git.nix
    ./nix.nix
    ./nvim.nix
    ./starship.nix
  ];

  nixpkgs.config.bat = {
    enable = true;
  };

  programs.zsh.enable = true;
}
