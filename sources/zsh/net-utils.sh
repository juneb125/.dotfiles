#!/usr/bin/env bash
#
# net-utils.sh - useful functions that call 'curl'
#
# curl flags used:
#   -f means 'panic/abort on any http errors'
#   -s silences all messages, but
#   -S (in addition to -s) shows error messages
#   -L retry request if url was moved

# inspired by github:sioodmy/dotfiles (path: user/wrapped/zsh/aliases.nix)
license() {
  local license_uri=""
  local spdx_db="https://raw.githubusercontent.com/spdx/license-list-data/main/text"
  case "${1}" in
    # the one from gnu.org centers some text, which i like :)
    ("GPL-3.0") license_uri="https://www.gnu.org/licenses/gpl-3.0.txt" ;;
    ("-h"|"--help")
      cat <<EOF
Get a license's content as text

Usage: license <TYPE> [options...]

Arguments:
  <TYPE>  what kind of license (SPDX License Identifier)

Options:
  [ all curl(1) options apply ]
EOF
      return 0 ;;
    (*) license_uri="${spdx_db}/${1}.txt" ;;
  esac

  curl -fsSL "${@:2}" -- "${license_uri}" || return $?

  # yellow foreground, with a newline above
  printf '\n\x1b[0;33m%s\x1b[m\n' "Make sure to check for any required fields"
}

gh-raw() {
  local full_path=""
  case "$1" in
    ("")
      echo "${0}: expected full path as \$1" >&2
      return 1 ;;
    ("-h"|"--help")
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
      return $? ;;
    (*) full_path="$1" ;;
  esac

  curl -fsSL "https://raw.githubusercontent.com/${full_path}" ${@:2}
  return $?
}

mit() {
  if [[ "${1}" = "--help" ]]; then
    cat <<EOF
Get the MIT License's content, with its fields filled in

Usage: mit [OUTPUT]

Arguments:
  [OUTPUT]  where to place the output text (default: -)
EOF
    return 0
  fi

  local out_file="${1:--}"
  local spdx_db="https://raw.githubusercontent.com/spdx/license-list-data/main"
  curl -fsSL "${spdx_db}/text/MIT.txt" -o "${out_file}"
  local curl_res=$?

  if [[ "${out_file}" = - ]]; then
    return ${curl_res}
  fi

  local sub_year="s/<year>/$(date +'%Y')/"
  local git_username="$(git config --get user.name)"
  local sub_username="s/<copyright holders>/${git_username}/"

  if [[ -n "${git_username}" ]]; then
    sed -i "" "${sub_year}; ${sub_username}" ${out_file}
  else
    sed -i "" "${sub_year}" ${out_file}
    # yellow foreground, with a newline above
    printf '\n\x1b[0;33m%s\x1b[m\n' 'Remember to fill out the <copyright holders> field!'
  fi
}

