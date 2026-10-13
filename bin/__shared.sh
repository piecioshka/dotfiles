#!/usr/bin/env bash

case "$(uname -s)" in
  Linux*) os="linux" ;;
  Darwin*) os="macos" ;;
  CYGWIN*|MINGW*|MSYS*|Windows_NT) os="windows" ;;
  *) os="unknown" ;;
esac

function __print_title {
  echo -e "${__COLOR_BLUE_LIGHT}==> ${1}${__COLOR_RESET}"
}

function __print_action {
  echo -e "${__COLOR_BLUE_LIGHT}==> ${__COLOR_GREEN}[x]${__COLOR_BLUE} # ${__COLOR_RESET}${1}"
}
