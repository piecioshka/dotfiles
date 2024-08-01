#!/usr/bin/env bash

### Load file with colors
source ~/projects/dotfiles/configs/shells/.colors.sh

base=`pwd`

__print_dotfile_line() {
  message="${1}"
  echo -e "\n${__BLUE_LIGHT}${message}${__WHITE}"
}

# ------------------------------------------------------------------------------

__collect_vsc() {
  __print_dotfile_line "==> Visual Studio Code"
  rm -rf ./configs/vsc/*
  path="$HOME/Library/Application Support/Code/User/"
  cp "${path}keybindings.json" ./configs/vsc/
  cp "${path}settings.json" ./configs/vsc/
  cp -R "${path}snippets" ./configs/vsc/
}

echo -e "Collect configs"

__collect_vsc
