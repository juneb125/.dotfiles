{ pkgs, config, ... }: {
  nixpkgs.config.zsh = let
    histSize = 5000;
    # should be $HOME/.dotfiles/
    flakeHome = builtins.toString ./../..;
    zshFnHome = "${builtins.getEnv "HOME"}/.dotfiles/.config/zsh";
  in {
    enable = true;
    shellAliases = import ./aliases.nix;
    history = {
      size = histSize;
      save = histSize;
      append = true;
    };

    # line editor options
    enableSyntaxHighlighting = true;
    enableCompletion = true;
    autosuggestions.enable = true;

    # misc. options
    setOptions = [
      "append_history"
      "share_history"
      "hist_ignore_space"
      "hist_ignore_all_dups"
      "hist_save_no_dups"
      "hist_ignore_dups"
      "hist_find_no_dups"
    ];

    # extras
    initExtra = ''
      # Keybinds
      bindkey '^I' autosuggest-accept      # tab
      bindkey '^p' history-search-backward # ctrl p
      bindkey '^n' history-search-forward  # ctrl n

      # Functions
      source ${zshFnHome}/fn.sh
    '';
    envExtra = ''
      export EDITOR='nvim'
      export FLAKE_HOME=${flakeHome}
    '';
  };
}
