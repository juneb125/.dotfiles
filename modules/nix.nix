{ ... }: {
  nix.enable = true;

  # allow unfree (i.e., not open-source) pkgs
  nixpkgs.config.allowUnfree = true;

  # ref: https://nix.dev/manual/nix/2.28/command-ref/conf-file.html
  nix.settings = {
    experimental-features = ["nix-command" "flakes"]; # necessary for using flakes
    warn-dirty = false;
  };

  # nix.package = pkgs.nix;
  documentation = {
    enable = true;
    doc.enable = true;
    info.enable = false;
    man.enable = true;
  };
}
