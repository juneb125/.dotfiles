{ lib, config, pkgs, ... }: {
  options = {
    darwin.enable = lib.mkEnableOption "darwin 'system.defaults' settings";
  };

  config = lib.mkIf (pkgs.stdenv.isDarwin && config.darwin.enable) {
    system.primaryUser = "junebergeron";
    system.defaults = {
      finder = {
        AppleShowAllFiles = true;
      };
      # more to come ...
    };
  };
}
