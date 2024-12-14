{ self, pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	# Search for packages in https://search.nixos.org/packages
	# List packages installed in system profile. To search by name, run:
	# $ nix-env -qaP | grep <pkg-name>
	environment.systemPackages = with pkgs; [
		# bat
		fastfetch
		git
		neovim
		zsh
	];

	fonts.packages = with pkgs; [
		(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
		# nixpkgs-unstable:
		# nerd-fonts.jetbrains-mono
	];

	# Necessary for using flakes on this system
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Set Git commit hash for darwin-version
	system.configurationRevision = self.rev or self.dirtyRev or null;

	# Used for backwards compatibility, please read the changelog before changing
	# $ darwin-rebuild changelog
	system.stateVersion = 5;

	# The platform the configuration will be used on
	nixpkgs.hostPlatform = "aarch64-darwin";

	# Auto upgrade nix package and the daemon service
	services.nix-daemon.enable = true;
	# nix.package = pkgs.nix;
}
