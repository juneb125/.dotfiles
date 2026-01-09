#!/usr/bin/env bash
#
# fn.sh - useful shell functions :)

proj() {
  (( $# > 1 )) && echo "Expected 1 argument, got $#.\nIgnoring the rest..."
  if [[ -z "${PROJ_DIR}" || ! -d "${PROJ_DIR}" ]]; then
    echo "${0}: \$PROJ_DIR doesn't exist or isn't set" >&2
    return 1
  fi
  local dest_dir="${PROJ_DIR}"

  case "$1" in;
    "") ;;
    "rs") dest_dir+='/RustProjects' ;;
    "ll") dest_dir+='/LowLevelProjects' ;;
    "xc") dest_dir+='/XcodeProjects' ;;
    "web") dest_dir+='/WebDevProjects' ;;
    "fn") dest_dir+='/FnProjects' ;;
    "misc") dest_dir+='/MiscProjects' ;;
    "-h" | "--help")
      cat <<EOF
${0}: quickly go to your project directory

Usage: ${0} [ABBREV|DIR]

Arguments:
  DIR     which project directory to go to
  ABBREV  use an abbreviation of a project subdirectory's name
            (values: [rs, ll, xc, web, fn, misc])

Environment:
  \$PROJ_DIR  what directory all of your projects are in
EOF
      return 0
      ;;
    *) dest_dir+="/${1}" ;;
  esac

  cd "${dest_dir}"
}

# TODO: write help message
config() {
  local config_dir="${XDG_CONFIG_HOME:-${HOME}/.dotfiles/sources}"

  case "$1" in;
    "") config_dir+='/..' ;;
    "ghostty" | "tty") config_dir+='/ghostty' ;;
    "nvim" | "neovim") config_dir+='/nvim' ;;
    "zsh") config_dir+='/zsh' ;;
    "-h" | "--help")
      echo "help message..."
      return 0
      ;;
    *) config_dir+="/${1}" ;;
  esac

  cd "${config_dir}"
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

if [[ "${SHELL}" != *bash* ]]; then
  # 'help' is a bash builtin that apparently isn't also a zsh builtin
  help() {
    bash -c "help ${@}"
  }
fi
