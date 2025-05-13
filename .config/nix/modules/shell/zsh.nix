{ pkgs, config, ... }: {
  nixpkgs.config.zsh = let
    histsize = 5000;
    zshFnHome = "${builtins.getEnv "HOME"}/.dotfiles/.config/zsh";
  in {
    enable = true;
		# shell aliases in ./aliases.nix
    history = {
      size = histsize;
      save = histsize;
      append = true;
    };
    setOptions = [
      "append_history"
      "share_history"
      "hist_ignore_space"
      "hist_ignore_all_dups"
      "hist_save_no_dups"
      "hist_ignore_dups"
      "hist_find_no_dups"
    ];
		# initExtraBeforeCompInit = ''
		initExtra = ''
      # Keybinds
      bindkey '^I' autosuggest-accept      # tab
      bindkey '^p' history-search-backward # ctrl p
      bindkey '^n' history-search-forward  # ctrl n

      # Functions
      source ${zshFnHome}/fn.sh
    '';
  };
}
