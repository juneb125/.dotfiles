#!/usr/bin/env bash
#
# fn.sh - useful shell functions :)

proj() {
  local dest_dir="${PROJ_DIR}"
  if [[ -z "${dest_dir}" || ! -d "${dest_dir}" ]]; then
    echo "${0}: \$PROJ_DIR doesn't exist or isn't set" >&2
    return 1
  fi

  case "$1" in
    ("") ;;
    ("rs") dest_dir+='/RustProjects' ;;
    ("ll") dest_dir+='/LowLevelProjects' ;;
    ("xc") dest_dir+='/XcodeProjects' ;;
    ("web") dest_dir+='/WebDevProjects' ;;
    ("fn") dest_dir+='/FnProjects' ;;
    ("misc") dest_dir+='/MiscProjects' ;;
    ("-h"|"--help")
      cat <<EOF
proj: quickly go to an area or a specific project
      An 'area' is how you split up and organize all of your projects

Usage: ${0} [ABBREV|DIR]
       ${0} <ABBREV|DIR> [REST]

Arguments:
  DIR     the path relative to \$PROJ_DIR to go to
  ABBREV  use an abbreviation of an area's name
            (values: [rs, ll, xc, web, fn, misc])
  REST    go to a specific sub-directory in an area

Environment:
  \$PROJ_DIR  what directory all of your areas are in
EOF
      return 0 ;;
    (*) dest_dir+="/${1}" ;;
  esac

  shift
  cd "${dest_dir}/${@}"
}

config() {
  local dest_dir="${XDG_CONFIG_HOME}"
  if [[ -z "${dest_dir}" || ! -d "${dest_dir}" ]]; then
    echo "${0}: \$XDG_CONFIG_HOME doesn't exist or isn't set" >&2
    return 1
  fi

  case "$1" in
    ("") dest_dir+='/..' ;;
    ("-h"|"--help")
      cat <<EOF
${0}: quickly go to your config home

Usage: ${0} [DIR]

Arguments:
  DIR  the path relative to \$XDG_CONFIG_HOME to go to

Environment:
  \$XDG_CONFIG_HOME  what directory all of your configs are in
EOF
      return 0 ;;
    (*) dest_dir+="/${1}" ;;
  esac

  cd "${dest_dir}"
}

# see Credits #1.1
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# see Credits #1.2
numfiles() {
  local dir="${1:-.}"
  local num="$(ls -A -1 "${dir}" | wc -l)"
  echo "${num} files in ${dir}"
}

toLower() {
  tr '[A-Z]' '[a-z]' <<< "${1}"
}

toUpper() {
  tr '[a-z]' '[A-Z]' <<< "${1}"
}

hr() {
  local value=""
  case "${1}" in
    ("--help")
      cat <<EOF
human-readable representations of colon-separated env vars

Usage: hr [man|path|<VALUE>]

Arguments:
  man    transform output of manpath(1)
  path   transform output of \$PATH
  VALUE  the value to transform
EOF
      return 0 ;;
    ("man")  value="$(manpath)" ;;
    ("path") value="${PATH}" ;;
    (*) value="${1}" ;;
  esac
  echo "${value//:/\n}"
}

colors() {
  local blocks='███' # 3x U+2588
  local i=''

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

if [[ "${SHELL}" != *bash* ]]; then
  # 'help' is a bash builtin that apparently isn't also a zsh builtin
  help() {
    bash -c "help ${@}"
  }
fi

printenv() {
  if (( $# > 0 )); then
    # do regular 'printenv' if any args are given (to not transform any values)
    command printenv "${@}"
    return $?
  fi
  command printenv | sed "s|${HOME}|~|g" | column -txc 2 -s'='
}
