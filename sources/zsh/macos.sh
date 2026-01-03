#!/usr/bin/env zsh

xcode() {
  if [[ -z "${1}" || -e ${1} ]]; then
    open ${1} -a Xcode.app
  else
    echo "${0}: ${1} doesn't exist"
    return 1
  fi
}

sm() {
  local domain="com.apple.WindowManager GloballyEnabled"

  case "$1" in;
    "--help")
      cat <<EOF
Read and write Stage Manager settings

to read:   ${0}
to write:  ${0} [true|false]
EOF
      return 0
      ;;
    "")
      if [[ "$(eval "defaults read ${domain}")" == "0" ]]; then
        echo "stage manager is off (0)"
      else
        echo "stage manager is on (1)"
      fi
      ;;
    "true"|"false")
      eval "defaults write ${domain} -bool ${1}"
      ;;
    *)
      echo "${0}: invalid input: ${1}"
      return 1
      ;;
  esac
}
