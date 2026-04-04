{ lib, config, ... }: {
  nixpkgs.config.neovim = lib.mkIf config.programs.neovim.enable {
    defaultEditor = true;
    viAlias = false;
    vimAlias = false;
  };
}
