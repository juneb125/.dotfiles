# -- General Config --
{ config, inputs, lib, pkgs, pkgs-unstable, ... }: {

  # imports = [];

  nixpkgs = {
    config.allowUnfree = true; # allow unfree (i.e., not open-source) pkgs
    hostPlatform = "aarch64-darwin"; # platform the config will be used on
  };

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

  # necessary for using flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # set git commit hash for darwin-version
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;

  # used for backwards compatibility, read the changelog before changing
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # auto upgrade nix pkg and the daemon service
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;
}
