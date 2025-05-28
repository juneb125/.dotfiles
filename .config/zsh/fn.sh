#!/usr/bin/env zsh

xcode() {
	case "$1" in;
		"") open -a Xcode.app ;;
		*) if [[ -d $1 || -f $1 ]]; then
			open $1 -a Xcode.app
		else
			echo "xcode: $1 doesn't exist"
			return 1
		fi ;;
	esac
	return $?
}

# TODO: write help message
proj() {
	local proj_dir=$HOME/Desktop/Coding

	case "$1" in;
		"") cd $proj_dir ;;
		"rs") cd $proj_dir/RustProjects ;;
		"xc" | "xcode") cd $proj_dir/XcodeProjects ;;
		"web") cd $proj_dir/WebDevProjects ;;
		"misc") cd $proj_dir/MiscProjects ;;
		"-h" | "--help") echo "help message..." ;;
		*) if [[ -d $1 ]]; then
			cd $proj_dir/$1
		else
			echo "proj: couldn't find $1 in ${proj_dir}"
			return 1
		fi ;;
	esac
	return $?
}

# TODO: write help message
config() {
	local config_dir=${XDG_CONFIG_HOME:-${HOME}/.dotfiles/.config}

	case "$1" in;
		"") cd $config_dir ;;
		"ghostty" | "tty") cd $config_dir/ghostty ;;
		"nix") cd $config_dir/nix ;;
		"nvim" | "neovim") cd $config_dir/nvim ;;
		"zsh") cd $config_dir/zsh ;;
		"-h" | "--help") echo "help message..." ;;
		*) if [[ -d $1 ]]; then
			cd $config_dir/$1
		else
			echo "config: couldn't find $1 in ${config_dir}"
			return 1
		fi ;;
	esac
	return $?
}

# TODO: write help message
b64() {
	case "$1" in;
		"")
			echo "b64: expected 1 argument, got none"
			return 1 ;;
		"-h" | "--help") echo "help message..." ;;
		*) echo -n "$1" | base64 $2 ;;
	esac
	return $?
}

finder() {
	case "$1" in;
		"") open -a Finder.app ;;
		*) if [[ -d $1 || -f $1 ]]; then
			open $1 -a Finder.app
		else
			echo "finder: $1 doesn't exist"
			return 1
		fi ;;
	esac
	return $?
}

# from github:theopn/dotfiles/zsh/.zshrc
mkcd() {
	mkdir -p $1 && cd $1
}

# from the same person who wrote `mkcd`
numfiles() {
	local dir=${1:-.}
	local num=$(ls -A $dir | wc -l)
	echo "$num files in $dir"
}
