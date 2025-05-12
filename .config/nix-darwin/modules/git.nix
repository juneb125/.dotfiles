{ pkgs, config, ... }: {
	nixpkgs.config.git = let
		name = "juneb125";
		token = builtins.getEnv "JUNES_GITHUB_TOKEN";
	in {
		enable = true;
		userName = name;
		userEmail = "jrbergeron823@gmail.com";
		aliases = {
			br = "branch";
			cam = "commit -am";
			cl = "clone";
			cm = "commit -m";
			co = "checkout";
			i = "init";
			log = "log --graph";
		};
		ignores = [
			"*.DS_Store"
			"*.swp"
			"*.tmp*"
		];
		config = {
			init.defaultBranch = "main";
			core.editor = "nvim";
			github = { inherit name token; };
		};
	};
}
