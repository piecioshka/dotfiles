#!/usr/bin/env bash

### Load file with colors
source ~/projects/dotfiles/configs/shells/.colors.sh

base=`pwd`

__print_dotfile_line() {
  message="${1}"
  echo -e "\n${__COLOR_BLUE_LIGHT}${message}${__WHITE}"
}

# ------------------------------------------------------------------------------

__remove_ssh() {
  __print_dotfile_line "==> SSH"
  rm ~/.ssh/
}

__remove_bash() {
  __print_dotfile_line "==> Bash"
  rm $base/configs/shells/bash/.bash_profile ~/.bash_profile
  rm $base/configs/shells/bash/.bashrc ~/.bashrc
  rm ~/.bash_history
}

__remove_zsh() {
  __print_dotfile_line "==> Zsh"
  rm $base/configs/shells/zsh/.zprofile ~/.zprofile
  rm $base/configs/shells/zsh/.zshrc ~/.zshrc
  rm ~/.zsh_history
}

__remove_fish() {
  __print_dotfile_line "==> Fish"
  rm -rf ~/.config/fish
  rm $base/configs/shells/fish/ ~/.config/fish
}

__remove_vim() {
  __print_dotfile_line "==> Vim"
  rm $base/configs/.vimrc ~/.vimrc
}

__remove_git() {
  __print_dotfile_line "==> Git"
  rm $base/configs/git/.gitattributes ~/.gitattributes
  rm $base/configs/git/.gitconfig ~/.gitconfig
  rm $base/configs/git/.gitignore ~/.gitignore
}

__remove_tig() {
  __print_dotfile_line "==> Tig"
  rm $base/configs/.tigrc ~/.tigrc
}

__remove_tmux() {
  __print_dotfile_line "==> Tmux"
  rm $base/configs/.tmux.conf ~/.tmux.conf
}

__remove_vsc() {
  __print_dotfile_line "==> Visual Studio Code"
  path="$HOME/Library/Application Support/Code/User/"

  if [ -d "${path}" ]; then
      echo -e "Directory ${path} exists\n"
      rm $base/configs/vsc/* "${path}"
  else
      echo -e "Directory ${path} not exists\n"
  fi
}

__remove_fzf() {
  __print_dotfile_line "==> fzf"
  rm $base/configs/.fzf.bash ~/.fzf.bash
  rm $base/configs/.fzf.zsh ~/.fzf.zsh
}

__remove_fastfetch() {
  __print_dotfile_line "==> fastfetch"
  rm $base/configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
}

__remove_mc() {
  __print_dotfile_line "==> mc"
  rm $base/configs/mc/ini ~/.config/mc/ini
}

echo -e "Remove configs"

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
