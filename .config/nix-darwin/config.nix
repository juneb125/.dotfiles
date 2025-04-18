# -- General Config --
{ inputs, lib, pkgs, pkgs-unstable, ... }: {

	# imports = [];

  nixpkgs = {
    config.allowUnfree = true; # allow unfree (i.e., not open-source) pkgs
    hostPlatform = "aarch64-darwin"; # platform the config will be used on
  };

  environment = {
    shells = [ pkgs.zsh ];

    # search for packages in https://search.nixos.org/packages
    systemPackages = (with pkgs; [
        # bat
        erlang_27 # required for gleam
        fastfetch
        git
        neovim
        rebar3
        starship # prompt customization
      ]) ++ (with pkgs-unstable; [
        deno
        gleam
      ]);

    variables = {
      SHELL = lib.getExe pkgs.zsh;
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

  programs.zsh = {
    enable = true;
  };

  nixpkgs.config.git = {
    enable = true;
    userName = "juneb125";
    userEmail = "jrbergeron823@gmail.com";
    ignores = [
      "*.DS_Store"
      "*.swp"
      "*.tmp*"
    ];
    config = {
      init = { defaultBranch = "main"; };
    };
  };

  nixpkgs.config.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
