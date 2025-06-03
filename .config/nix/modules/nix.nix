{ pkgs, config, ... }: {
  nix.enable = true;

  # allow unfree (i.e., not open-source) pkgs
  nixpkgs.config.allowUnfree = true;

  # necessary for using flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic = true;
    # bimonthly
    interval = [
      {Day = 1;}
      {Day = 15;}
    ];
  };

  # nix.package = pkgs.nix;
}
