#!/usr/bin/env zsh

# TODO: write help message
proj() {
  [[ $# -gt 1 ]] && echo "Expected 1 argument, got ${#}.\nIgnoring the rest..."
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

as_lower() {
  echo "${1}" | tr '[:upper:]' '[:lower:]'
}

# TODO: get more license uri's
# inspired by github:sioodmy/dotfiles/user/wrapped/zsh/aliases.nix
license() {
  local license_type="$(as_lower $1)"
  local license_uri=""
  case $license_type in;
    # "apache-2" | "apache-2.0") license_uri="" ;;
    "gpl-3" | "gpl-3.0") license_uri="https://www.gnu.org/licenses/gpl-3.0.txt" ;;
    "mit") license_uri="https://raw.githubusercontent.com/juneb125/pict/main/LICENSE" ;;
    # "un" | "unlicense") license_uri="" ;;

    "-h" | "--help")
      cat <<EOF
Get a license's content

Usage:
  license <TYPE> [OUTPUT]
  license --help

Arguments:
  <TYPE>    what kind of license [possible values: "mit", "apache-2.0", "gpl-3.0"]
  [OUTPUT]  where the license's content should go
EOF
      return 0
      ;;
    *)
      printf '%s\n%s\n' "license: unrecognized license type" 'possible values: ["mit", "gpl-3"]'
      return 1
  esac

  if [[ -z $2 ]]; then
    curl ${license_uri}
  else
    curl ${license_uri} -o $2
  fi
  return $?
}

gh-raw() {
  local full_path=""
  case "$1" in;
    "")
      echo "gh-raw: expected full path as \$1"
      return 1
      ;;
    "-h" | "--help") cat <<EOF
Curl \`raw.githubusercontent.com\` easier

Usage:
  gh-raw <FULL-PATH> [options...]

Arguments:
  <FULL-PATH>  the path to the file to curl
                 in the structure of
		 "<user>/<repo>/<branch>/<path-to-file>"

Options:
  ( all \`curl\` options apply )
EOF
      return $?
      ;;
    *) full_path="$1" ;;
  esac

  curl "https://raw.githubusercontent.com/${full_path}" ${*:2}
  return $?
}
