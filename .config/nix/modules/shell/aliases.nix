{ pkgs, config, ... }: {
	nixpkgs.config.zsh.shellAliases = {
		# navigation
		".." = "cd ..";
		"..." = "cd ../..";
		dotfiles = "cd ~/.dotfiles";

		# 'ls'
		la = "ls -aG";
		ll = "ls -lG";
		lal = "ls -alG";

		# git
		ga = "git add";
		gb = "git branch";
		gd = "git diff";
		gl = "git log --graph";
		gp = "git push";
		gs = "git status";

		# vim / nvim
		nv = "nvim";
		# vi -> nvim alias handled in neovim.viAlias
		# vim -> nvim alias handled in neovim.vimAlias

		# misc.
		c = "clear";
		clr = "clear";
		e = "exit 0";
		scerr = "scutil --error";
		clang-c = "clang -std=c99 -Wall -Werror ";
	};
}
