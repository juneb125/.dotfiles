#!/usr/bin/env zsh

# TODO: write help message
proj() {
  [[ $# -gt 1 ]] && echo "Expected 1 argument, got ${#}.\nIgnoring the rest..."
  local proj_dir="${HOME}/Desktop/Coding"
  if [[ ! -d ${proj_dir} ]]; then
    echo "${0}: ${proj_dir} doesn't exist"
    return 1
  fi

  case "$1" in;
    "") cd ${proj_dir} ;;
    "rs") cd ${proj_dir}/RustProjects ;;
    "xc") cd ${proj_dir}/XcodeProjects ;;
    "web") cd ${proj_dir}/WebDevProjects ;;
    "fn") cd ${proj_dir}/FnProjects ;;
    "misc") cd ${proj_dir}/MiscProjects ;;
    "-h" | "--help") echo "help message..." ;;
    *) if [[ -d "${proj_dir}/${1}" ]]; then
      cd "${proj_dir}/${1}"
    else
      echo "${0}: couldn't find ${1} in ${proj_dir}"
      return 1
    fi ;;
  esac
  return $?
}

# TODO: write help message
config() {
  local config_dir=${XDG_CONFIG_HOME:-${HOME}/.dotfiles/sources}

  case "$1" in;
    "") cd ${config_dir}/.. ;;
    "ghostty" | "tty") cd ${config_dir}/ghostty ;;
    "nvim" | "neovim") cd ${config_dir}/nvim ;;
    "zsh") cd ${config_dir}/zsh ;;
    "-h" | "--help") echo "help message..." ;;
    *) if [[ -d "${config_dir}/${1}" ]]; then
      cd "${config_dir}/${1}"
    else
      echo "${0}: couldn't find ${1} in ${config_dir}"
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
  local num=$(ls -A -1 ${dir} | wc -l)
  echo "${num} files in ${dir}"
}

toLower() {
  tr 'A-Z' 'a-z' <<< "${1}"
}

toUpper() {
  tr 'a-z' 'A-Z' <<< "${1}"
}

# TODO: get more license uri's
# inspired by github:sioodmy/dotfiles/user/wrapped/zsh/aliases.nix
license() {
  local license_type="$(toLower ${1})"
  local license_uri=""
  local spdx_db="https://raw.githubusercontent.com/spdx/license-list-data/main/text"
  case "${license_type}" in;
    "apache-2.0") license_uri="${spdx_db}/Apache-2.0.txt" ;;
    "gpl-3.0") license_uri="https://www.gnu.org/licenses/gpl-3.0.txt" ;;
    "mit") license_uri="${spdx_db}/MIT.txt" ;;
    "unlicense") license_uri="${spdx_db}/Unlicense.txt" ;;

    "-h" | "--help")
      cat <<EOF
Get a license's content

Usage:
  license <TYPE> [OUTPUT]
  license --help

Arguments:
  <TYPE>    what kind of license [possible values: "apache-2.0", "mit", "gpl-3.0", "unlicense", + more]
  [OUTPUT]  where the license's content should go (default: stdout)
EOF
      return 0
      ;;
    *)
      printf '%s\n%s\n' \
        "license: unrecognized license type" \
        '         possible values: ["mit", "apache-2.0", "gpl-3.0"]'
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
      echo "${0}: expected full path as \$1"
      return 1
      ;;
    "-h" | "--help")
      cat <<EOF
Curl \`raw.githubusercontent.com\` easier

Usage:
  gh-raw <FULL-PATH> [options...]

Arguments:
  <FULL-PATH>  the path to the file to curl, in the structure of
               "<user>/<repo>/<branch>/<path-to-file>"

Options:
  [ all curl(1) options apply ]
EOF
      return $?
      ;;
    *) full_path="$1" ;;
  esac

  curl "https://raw.githubusercontent.com/${full_path}" ${*:2}
  return $?
}

# more human-readable ('hr') rep. of $PATH
hr-path() {
  tr ':' '\n' <<< "${PATH}"
}
