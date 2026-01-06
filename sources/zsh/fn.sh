#!/usr/bin/env bash
#
# fn.sh - useful shell functions :)

# TODO: write help message
proj() {
  (( $# > 1 )) && echo "Expected 1 argument, got $#.\nIgnoring the rest..."
  local proj_dir="${HOME}/Desktop/Coding"
  if [[ ! -d "${proj_dir}" ]]; then
    echo "${0}: ${proj_dir} doesn't exist"
    return 1
  fi

  case "$1" in;
    "") cd ${proj_dir} ;;
    "rs") cd ${proj_dir}/RustProjects ;;
    "ll") cd ${proj_dir}/LowLevelProjects ;;
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
}

# TODO: write help message
config() {
  local config_dir="${XDG_CONFIG_HOME:-${HOME}/.dotfiles/sources}"

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
}

# from github:theopn/dotfiles/zsh/.zshrc
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# from the same person who wrote `mkcd`
numfiles() {
  local dir=${1:-.}
  local num=$(ls -A -1 "${dir}" | wc -l)
  echo "${num} files in ${dir}"
}

toLower() {
  tr '[A-Z]' '[a-z]' <<< "${1}"
}

toUpper() {
  tr '[a-z]' '[A-Z]' <<< "${1}"
}

hr() {
  local value=
  case "$(toLower $1)" in;
    "--help")
      cat <<EOF
human-readable representations of colon-separated env vars

Usage: hr [man|path|<VALUE>]

Arguments:
  VALUE  the value to transform
EOF
      return $?
      ;;
    "man")  value=$(manpath) ;;
    "path") value="${PATH}" ;;
    *) value="${1}" ;;
  esac
  tr ':' '\n' <<< "${value}"
}

colors() {
  local blocks='███' # 3x U+2588

  echo -n "\n  "
  for i in {0..7}; do
    echo -n "\x1b[0;3${i}m${blocks}"
  done

  # bright colors
  echo -n "\n  "
  for i in {8..15}; do
    echo -n "\x1b[0;38;5;${i}m${blocks}"
  done
  echo "\x1b[m"
}

# from https://www.youtube.com/watch?v=G3NJzFX6XhY&t=721s
gl-pretty() {
  git log --graph --pretty=\
    format:'%C(yellow)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'
}

if [[ "${SHELL}" == *zsh* ]]; then
  # 'help' is a bash builtin that apparently isn't also a zsh builtin
  help() {
    bash -c "help ${@}"
  }
fi
