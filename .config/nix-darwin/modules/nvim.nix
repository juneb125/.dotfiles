{ pkgs, config, ... }: {
	nixpkgs.config.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
	};
}
