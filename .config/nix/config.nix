# -- General Config --
{ config, inputs, lib, pkgs, pkgs-unstable, ... }: {
  # imports = [];

  # platform the config will be used on
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment = {
    shells = [ pkgs.zsh ];

    # search for packages in https://search.nixos.org/packages
    systemPackages = (with pkgs; [
        alejandra
        # bat
        delta
        erlang_27 # required for gleam
        fastfetch
        fd
        git
        just
        neovim
        rebar3 # also a gleam thing
        ripgrep
        starship # prompt customization
      ])
      ++ (with pkgs-unstable; [
        deno
        gleam
      ]);

    variables = {
      SHELL = lib.getExe pkgs.zsh;
      FLAKE_HOME = builtins.toString ./.;
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
