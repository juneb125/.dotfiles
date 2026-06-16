{ flake, lib, pkgs, ... }: let
  sys = "x86_64-linux";
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
        clang-tools
        curl
        entr
        fastfetch
        fd
        gcc
        git
        gnupg
        gnumake
        jq
        just
        neovim
        ripgrep
        shellcheck
        # starship # panics on WSL2
        vim
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
  # system.configurationRevision = inputs.rev or inputs.dirtyRev or null;

  # used for backwards compatibility, read the changelog before changing
  # $ nixos-rebuild changelog
  system.stateVersion = "25.05";

  nixpkgs.config.bat.enable = true;
  nixpkgs.config.git.enable = true;
  # nixpkgs.config.starship.enable = true;

  programs.zsh.enable = true;

  wsl.enable = true;
}
