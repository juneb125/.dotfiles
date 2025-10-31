if [[ ! -n ${ZPLUGINDIR} ]]; then
  echo "\x1b[0;31mZPLUGINDIR must be set in order to download / update the plugins\x1b[m"
  return 1
fi

get-syntax-highlighting() {
  local dest="${ZPLUGINDIR}/zsh-syntax-highlighting"
  [[ -d ${dest} ]] || mkdir -p ${dest}

  local repo="https://github.com/zsh-users/zsh-syntax-highlighting.git"
  local res=0
  if [[ ! -d ${dest}/.git ]]; then
    echo "\x1b[0;33m${0}: Downloading zsh-syntax-highlighting...\x1b[m"
    git clone ${repo} ${dest} --depth 1
    res=$?
    ${res} && "\x1b[0;32m${0}: Download successful\x1b[m"
  fi

  if [[ ! ${res} ]]; then
    echo "\x1b[0;31m${0}: Download failed\x1b[m"
  fi

  return ${res}
}
