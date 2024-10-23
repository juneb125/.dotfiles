{
  description = "June's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
		nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, ... }: {
	
			nixpkgs.config.allowUnfree = true;

			# Search for packages in https://search.nixos.org/packages
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep <pkg-name>
      environment.systemPackages = [
				pkgs.neofetch
				pkgs.neovim
			];

			homebrew = {
				enable = true;
				brews = [
					"zsh" # shell
					"git" # version control system
				];
				casks = [ "warp" ];
				onActivation.cleanup = "zap";	
				onActivation.autoUpdate = true;
				onActivation.upgrade = true;
			};
	
			fonts.packages = [
				(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
			];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild switch --flake path/to/flake.nix#Junes-MacBook-Air
    darwinConfigurations."Junes-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
				configuration
				nix-homebrew.darwinModules.nix-homebrew
				{
					nix-homebrew = {
						enable = true;

						# Apple Silicon only
						enableRosetta = true;

						# User owning the Homebrew prefix
						user = "junebergeron";

						autoMigrate = true;
					};
				}
			];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Junes-MacBook-Air".pkgs;
  };
}
