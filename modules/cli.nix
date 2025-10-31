# misc. cli configs
{ pkgs, config, ... }: {
  nixpkgs.config.bat = {
    enable = true;
  };
}
