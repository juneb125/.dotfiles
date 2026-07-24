{ flake, inputs, lib, pkgs, ... }: let
  sys = "aarch64-darwin";
in {
  imports = [
    "${flake}/modules"
  ];

  # platform the config will be used on
  nixpkgs.hostPlatform = sys;

  environment = {
    shells = [pkgs.zsh];

    # search for packages in https://search.nixos.org/packages
    systemPackages = lib.flatten [
      (with pkgs; [
        alejandra
        bat
        delta
        # deno
        entr
        fastfetch
        fd
        git
        git-cliff
        gnupg
        groff
        just
        mdbook
        neovim
        pass
        ripgrep
        shellcheck
        skim
        starship
        zig
        zls
      ])
      flake.packages.${sys}.pict
      flake.packages.${sys}.tree
    ];

    variables = {
      SHELL = lib.getExe pkgs.zsh;
      BAT_THEME = "Catppuccin Macchiato";
    };
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  # set git commit hash for darwin-version
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;

  # used for backwards compatibility, read the changelog before changing
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  nixpkgs.config.bat.enable = true;
  nixpkgs.config.git.enable = true;
  nixpkgs.config.starship.enable = true;

  programs.zsh.enable = true;

  darwin.enable = true;
}
