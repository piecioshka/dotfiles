#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/__shared.sh"
source "$script_dir/configs/shells/__colors.sh"

base=`pwd`

function __link_file {
  file1=${1}
  file2=${2}
  echo -e ""
  ls -la --color=auto "${file2}"
  rm -rf "${file2}"
  __print_action "Remove file: ${file2}"
  __print_action "Link file: ${file1} => ${file2}"
  ln -s "${file1}" "${file2}"
}

# ------------------------------------------------------------------------------

function __install_profile {
  __print_title ".profile"
  __link_file $base/configs/.profile ~/.profile
}

function __install_bash {
  __print_title "Bash"
  __link_file $base/configs/shells/bash/.bash_profile ~/.bash_profile
  __link_file $base/configs/shells/bash/.bashrc ~/.bashrc
}

function __install_zsh {
  __print_title "Zsh"
  __link_file $base/configs/shells/zsh/.zprofile ~/.zprofile
  __link_file $base/configs/shells/zsh/.zshrc ~/.zshrc
}

function __install_fish {
  __print_title "Fish"
  rm -rf ~/.config/fish
  __link_file $base/configs/shells/fish/ ~/.config/fish
}

function __install_vim {
  __print_title "Vim"
  __link_file $base/configs/.vimrc ~/.vimrc
  mkdir -p ~/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  # vim +PluginInstall +qall
  echo | echo | vim +PluginInstall +qall &>/dev/null
}

function __install_git {
  __print_title "Git"
  __link_file $base/configs/git/.gitattributes ~/.gitattributes
  __link_file $base/configs/git/.gitconfig ~/.gitconfig
  __link_file $base/configs/git/.gitignore ~/.gitignore
}

function __install_tig {
  __print_title "Tig"
  __link_file $base/configs/.tigrc ~/.tigrc
}

function __install_tmux {
  __print_title "Tmux"
  __link_file $base/configs/.tmux.conf ~/.tmux.conf
}

function __install_vsc {
  __print_title "Visual Studio Code"

  case "$(uname -s)" in
    Linux*)
      echo "Running on Linux"
      echo "TODO: check what path is used by VSC"
      ;;
    Darwin*)
      echo "Running on macOS"
      path="$HOME/Library/Application Support/Code/User/"
      ;;
    CYGWIN*|MINGW*|MSYS*|Windows_NT)
      echo "Running on Windows"
      path="$HOME/AppData/Roaming/Code/User/"
      ;;
    *)
      echo "Unknown OS"
      ;;
  esac

  if [ -d "${path}" ]; then
    __link_file $base/configs/vsc/snippets/ "${path}snippets"
    __link_file $base/configs/vsc/keybindings.json "${path}keybindings.json"
    __link_file $base/configs/vsc/settings.json "${path}settings.json"
  else
    echo -e "Directory ${path} not exists\n"
  fi
}

function __install_cursor {
  __print_title "Cursor"

  case "$(uname -s)" in
    Linux*)
      echo "Running on Linux"
      echo "TODO: check what path is used by Cursor"
      ;;
    Darwin*)
      echo "Running on macOS"
      path="$HOME/Library/Application Support/Cursor/User/"
      ;;
    CYGWIN*|MINGW*|MSYS*|Windows_NT)
      echo "Running on Windows"
      path="$HOME/AppData/Roaming/Cursor/User/"
      ;;
    *)
      echo "Unknown OS"
      ;;
  esac

  if [ -d "${path}" ]; then
    __link_file $base/configs/vsc/snippets/ "${path}snippets"
    __link_file $base/configs/vsc/keybindings.json "${path}keybindings.json"
    __link_file $base/configs/vsc/settings.json "${path}settings.json"
  else
    echo -e "Directory ${path} not exists\n"
  fi
}

function __install_zed {
  __print_title "zed"
  __link_file $base/configs/.config/zed/settings.json ~/.config/zed/settings.json
}

function __install_fzf {
  __print_title "fzf"
  __link_file $base/configs/.fzf.bash ~/.fzf.bash
  __link_file $base/configs/.fzf.zsh ~/.fzf.zsh
}

function __install_fastfetch {
  __print_title "fastfetch"
  __link_file $base/configs/.config/fastfetch/ ~/.config/fastfetch
}

function __install_mc {
  __print_title "mc"
  __link_file $base/configs/.config/mc/ ~/.config/mc
}

function __install_btop {
  __print_title "btop"
  __link_file $base/configs/.config/btop/ ~/.config/btop
}

function __install_htop {
  __print_title "htop"
  __link_file $base/configs/.config/htop/ ~/.config/htop
}

echo "Install configs"

case "$(uname -s)" in
  Linux*)
    echo "Running on Linux"
    echo "TODO: verify tools"
    ;;
  Darwin*)
    echo "Running on macOS"
    __install_profile
    __install_bash
    __install_zsh
    __install_fish
    __install_git
    __install_vim
    __install_tig
    __install_tmux
    __install_vsc
    __install_cursor
    __install_zed
    __install_fzf
    __install_fastfetch
    __install_mc
    __install_btop
    __install_htop
    ;;
  CYGWIN*|MINGW*|MSYS*|Windows_NT)
    echo "Running on Windows"
    __install_bash
    __install_git
    __install_vsc
    ;;
  *)
    echo "Unknown OS"
    ;;
esac
