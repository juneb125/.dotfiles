#!/usr/bin/env zsh

xcode() {
  case "$1" in;
    "") open -a Xcode.app ;;
    *) if [[ -d $1 || -f $1 ]]; then
      open $1 -a Xcode.app
    else
      echo "xcode: $1 doesn't exist"
      return 1
    fi ;;
  esac
  return $?
}

finder() {
  case "$1" in;
    "") open -a Finder.app ;;
    *) if [[ -d $1 || -f $1 ]]; then
      open $1 -a Finder.app
    else
      echo "finder: $1 doesn't exist"
      return 1
    fi ;;
  esac
  return $?
}

preview() {
  case "$1" in;
    "") open $HOME -a Preview.app ;;
    *) if [[ -f $1 ]]; then
      open $1 -a Preview.app
    elif [[ -d $1 ]]; then
      echo "preview: can't open $1 because it's a directory"
      return 1
    else
      echo "preview: either $1 doesn't exist, "
      return 1
    fi ;;
  esac
  return $?
}
