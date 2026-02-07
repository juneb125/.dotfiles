{ ... }: {
  nixpkgs.config.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = false;
    vimAlias = false;
  };
}
