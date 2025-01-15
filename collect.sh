#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/__shared.sh"
source "$script_dir/configs/shells/__colors.sh"

# ------------------------------------------------------------------------------

function __collect_vsc {
  __print_title "Visual Studio Code"

  rm -rf ./configs/vsc/*
  path="$HOME/Library/Application Support/Code/User/"
  cp "${path}keybindings.json" ./configs/vsc/
  cp "${path}settings.json" ./configs/vsc/
  cp -R "${path}snippets" ./configs/vsc/
}

echo -e "Collect configs"

__collect_vsc
