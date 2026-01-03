{
  imports = [
    ./git.nix
    ./nix.nix
    ./nvim.nix
    ./shell
  ];

  nixpkgs.config.bat = {
    enable = true;
  };
}
