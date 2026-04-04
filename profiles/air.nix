{ flake, inputs, lib, pkgs, ... }: {
  imports = [
    "${flake}/modules"
  ];

  # platform the config will be used on
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment = {
    shells = [pkgs.zsh];

    # search for packages in https://search.nixos.org/packages
    systemPackages = lib.flatten [
      (with pkgs; [
        alejandra
        bat
        delta
        deno
        fastfetch
        fd
        git
        gnupg
        just
        mdbook
        neovim
        pass
        ripgrep
        shellcheck
        starship
      ])
      flake.packages."aarch64-darwin".pict
      flake.packages."aarch64-darwin".tree
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
