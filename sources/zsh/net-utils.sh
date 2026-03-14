#!/usr/bin/env bash
#
# net-utils.sh - useful functions that call 'curl'
#
# curl flags used:
#   -f means 'panic/abort on any http errors'
#   -s silences all messages, but
#   -S (in addition to -s) shows error messages
#   -L retry request if url was moved

# inspired by Credits #2
license() {
  local license_uri='https://raw.githubusercontent.com/spdx/license-list-data/main/text'
  case "${1}" in
    # the one from gnu.org centers some text, which i like :)
    ('GPL-3.0') license_uri='https://www.gnu.org/licenses/gpl-3.0.txt' ;;
    ('-h'|'--help')
      cat <<EOF
Get a license's text content

Usage: license <TYPE> [options...]

Arguments:
  <TYPE>  what kind of license (SPDX License Identifier)

Options:
  [ all curl(1) options apply ]
EOF
      return 0 ;;
    (*) license_uri+="/${1}.txt" ;;
  esac

  shift
  curl -fsSL "${@}" -- "${license_uri}" || return $?

  # yellow foreground, with a newline above
  printf '\n\x1b[0;33m%s\x1b[m\n' 'Make sure to check for any required fields!'
}

gh-raw() {
  local full_path=''
  case "${1}" in
    ('')
      echo "${0}: expected full path as \$1" >&2
      return 1 ;;
    ('-h'|'--help')
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
      return 0 ;;
    (*) full_path="${1}" ;;
  esac

  shift
  curl -fsSL "${@}" -- "https://raw.githubusercontent.com/${full_path}"
}

# TODO: 'out_file' positional arg
mit() {
  # local out_file="${1:--}"
  local spdx_db='https://raw.githubusercontent.com/spdx/license-list-data/main'

  case "${1}" in
    ('--help')
      cat <<EOF
Get the MIT license's text content, with its fields optionally filled in

Usage: mit [--raw]

Options:
  --raw  do not fill in '<year>' and '<copyright holders>' fields
EOF
      return 0 ;;
    ('--raw')
      curl -fsSL "${spdx_db}/text/MIT.txt" # -o "${out_file}"
      return $? ;;
  esac

  local sub_year="s/<year>/$(date +'%Y')/"
  local git_username="$(git config --get user.name 2>/dev/null)"
  local sub_username="s/<copyright holders>/${git_username}/"

  if [[ -n "${git_username}" ]]; then
    sed "${sub_year}; ${sub_username}" <(curl -fsSL "${spdx_db}/text/MIT.txt") # > "${out_file}"
  else
    sed "${sub_year}" <(curl -fsSL "${spdx_db}/text/MIT.txt") # > "${out_file}"
    # yellow foreground, with a newline above
    printf '\n\x1b[0;33m%s\x1b[m\n' 'Remember to fill out the <copyright holders> field!'
  fi
}
