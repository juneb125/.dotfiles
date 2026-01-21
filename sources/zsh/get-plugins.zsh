#!/usr/bin/env zsh
#
# get-plugins.zsh - script to download zsh plugins from source

if [[ -z "${ZPLUGINDIR}" ]]; then
  echo "\x1b[0;31mZPLUGINDIR must be set in order to download / update the plugins\x1b[m" >&2
  return 1
fi

get-syntax-highlighting() {
  local dest="${ZPLUGINDIR}/zsh-syntax-highlighting"

  # return early if plugin is already installed
  [[ -d "${dest}"/.git ]] && return 0

  echo "\x1b[0;33m${0}: downloading zsh-syntax-highlighting...\x1b[m"
  local repo="https://github.com/zsh-users/zsh-syntax-highlighting.git"
  git clone "${repo}" "${dest}" --depth 1
  local res=$?

  if [[ ${res} ]]; then
    echo "\x1b[0;32m${0}: download successful\x1b[m"
  else
    echo "\x1b[0;31m${0}: download failed with exit code ${res}\x1b[m" >&2
  fi

  return ${res}
}
