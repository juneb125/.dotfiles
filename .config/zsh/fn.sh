#!/usr/bin/env zsh

xcode() {
	if [[ $1 ]]; then
		open $1 -a Xcode.app
	else
		open -a Xcode.app
	fi
	return 0
}

proj() {
	local proj_dir=$HOME/Desktop/Coding
	case "$1" in;
		"rs") cd $proj_dir/RustProjects ;;
		"xc" | "xcode") cd $proj_dir/XcodeProjects ;;
		"web") cd $proj_dir/WebDevProjects ;;
		"misc") cd $proj_dir/MiscProjects ;;
		"-h" | "--help")
			cat <<-EOF
			Usage:
			  proj [rs|xcode|web|misc]
			EOF
			;;
		*) cd $proj_dir ;;
	esac
	return 0
}

config() {
	local config_dir=$HOME/.dotfiles/.config
	case "$1" in;
		"ghostty" | "tty") cd $config_dir/ghostty ;;
		"nix" | "darwin") cd $config_dir/nix-darwin ;;
		"nvim" | "neovim") cd $config_dir/nvim ;;
		"zsh") cd $config_dir/zsh ;;
		"-h" | "--help")
			cat <<-EOF
			Usage:
			  config [ghostty|nix|nvim|zsh]
			EOF
			;;
		"..") cd $HOME/.dotfiles ;;
		*) cd $config_dir ;;
	esac
	return 0
}

b64() {
	if [[ ! $1 ]]; then
		echo "b64: not enough arguments"
		return 1
	fi

	case "$1" in;
		"-h" | "--help")
			cat <<-EOF
			Usage:
			  b64 [<string>] [options]

			Options:
			  -d, --decode   Decode <string> from base64
			  -e, --encode   Encode <string> as base64 [default]
			  -h, --help     Show this help message
			EOF
			return 0
			;;
		*) ;;
	esac
	
	if [[ $2 ]]; then
		echo -n "$1" | base64 $2
	else;
		echo -n "$1" | base64
	fi
	return 0
}
