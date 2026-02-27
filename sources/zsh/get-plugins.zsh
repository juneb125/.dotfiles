#!/usr/bin/env zsh
#
# get-plugins.zsh - script to download zsh plugins from source

if [[ -z "${ZPLUGINDIR}" ]]; then
  echo "\x1b[0;31mZPLUGINDIR must be set in order to download / update the plugins\x1b[m" >&2
  return 1
fi

get-syntax-highlighting() {
  local dest="${ZPLUGINDIR}/zsh-syntax-highlighting"
  local repo="https://github.com/zsh-users/zsh-syntax-highlighting.git"

  if [[ -d "${dest}"/.git ]]; then
    # return early if already installed & no update arg
    [[ "${1}" != up* ]] && return 0

    echo "\x1b[0;33m${0}: updating zsh-syntax-highlighting...\x1b[m"
    git -C "${dest}" pull "${repo}" --depth=1 -f
  else
    echo "\x1b[0;33m${0}: downloading zsh-syntax-highlighting...\x1b[m"
    git clone "${repo}" "${dest}" --depth=1
  fi
}
