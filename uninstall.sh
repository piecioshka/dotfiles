#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/__shared.sh"
source "$script_dir/configs/shells/__colors.sh"

base=`pwd`

# ------------------------------------------------------------------------------

function __remove_ssh {
  __print_title "SSH"
  rm ~/.ssh/
}

function __remove_bash {
  __print_title "Bash"
  rm $base/configs/shells/bash/.bash_profile ~/.bash_profile
  rm $base/configs/shells/bash/.bashrc ~/.bashrc
  rm ~/.bash_history
}

function __remove_zsh {
  __print_title "Zsh"
  rm $base/configs/shells/zsh/.zprofile ~/.zprofile
  rm $base/configs/shells/zsh/.zshrc ~/.zshrc
  rm ~/.zsh_history
}

function __remove_fish {
  __print_title "Fish"
  rm -rf ~/.config/fish
  rm $base/configs/shells/fish/ ~/.config/fish
}

function __remove_vim {
  __print_title "Vim"
  rm $base/configs/.vimrc ~/.vimrc
}

function __remove_git {
  __print_title "Git"
  rm $base/configs/git/.gitattributes ~/.gitattributes
  rm $base/configs/git/.gitconfig ~/.gitconfig
  rm $base/configs/git/.gitignore ~/.gitignore
}

function __remove_tig {
  __print_title "Tig"
  rm $base/configs/.tigrc ~/.tigrc
}

function __remove_tmux {
  __print_title "Tmux"
  rm $base/configs/.tmux.conf ~/.tmux.conf
}

function __remove_vsc {
  __print_title "Visual Studio Code"
  path="$HOME/Library/Application Support/Code/User/"

  if [ -d "${path}" ]; then
      echo -e "Directory ${path} exists\n"
      rm $base/configs/vsc/* "${path}"
  else
      echo -e "Directory ${path} not exists\n"
  fi
}

function __remove_fzf {
  __print_title "fzf"
  rm $base/configs/.fzf.bash ~/.fzf.bash
  rm $base/configs/.fzf.zsh ~/.fzf.zsh
}

function __remove_fastfetch {
  __print_title "fastfetch"
  rm $base/configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
}

function __remove_mc {
  __print_title "mc"
  rm $base/configs/mc/ini ~/.config/mc/ini
}

echo "Remove configs"

__remove_ssh
__remove_bash
__remove_zsh
__remove_fish
__remove_git
__remove_vim
__remove_tig
__remove_tmux
__remove_vsc
__remove_fzf
__remove_fastfetch
__remove_mc
