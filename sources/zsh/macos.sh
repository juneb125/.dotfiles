#!/usr/bin/env zsh

xcode() {
  if [[ -z "${1}" || -e ${1} ]]; then
    open ${1} -a Xcode.app
  else
    echo "${0}: ${1} doesn't exist"
    return 1
  fi
}

finder() {
  if [[ -z "${1}" || -e ${1} ]]; then
    open ${1} -a Finder.app
  else
    echo "${0}: ${1} doesn't exist"
    return 1
  fi
}
