# -- General Config --
{ self, pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	# search for packages in https://search.nixos.org/packages
	environment.systemPackages = with pkgs; [
		# bat
		fastfetch
		git
		neovim
		zsh
	];

	fonts.packages = with pkgs; [
		(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
		# on nixpkgs-unstable:
		# nerd-fonts.jetbrains-mono
	];

	# necessary for using flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# set git commit hash for darwin-version
	system.configurationRevision = self.rev or self.dirtyRev or null;

	# used for backwards compatibility, read the changelog before changing
	# $ darwin-rebuild changelog
	system.stateVersion = 5;

	# platform the config will be used on
	nixpkgs.hostPlatform = "aarch64-darwin";

	# auto upgrade nix pkg and the daemon service
	services.nix-daemon.enable = true;
	# nix.package = pkgs.nix;
	
	nixpkgs.config.zsh = {
		enable = true;                     # default shell on macOS
		autocd = true;                     # automatically enter into a directory if typed
		# enableCompletion = true;         # enable autocompletions
		# enableSyntaxHighlighting = true; # enable syntax highlighting
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
