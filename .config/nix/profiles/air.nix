{ self, inputs, lib, pkgs, ... }: let
  # source-zsh-plugins = import "${self}/modules/shell/source-zsh-plugins.nix" {inherit pkgs lib;};
  pict = import "${self}/pkgs/pict.nix" {inherit pkgs lib;};
in {
  # imports = [];

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
        # erlang_27 # required for gleam
        fastfetch
        fd
        git
        # ghc
        # gleam
        just
        mdbook
        neovim
        rebar3 # also a gleam thing
        ripgrep
        shellcheck
        starship # prompt customization
        zsh-syntax-highlighting
      ])
      # source-zsh-plugins
      pict
    ];

    variables = {
      SHELL = lib.getExe pkgs.zsh;
      FLAKE_HOME = builtins.toString ./.;
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
}
