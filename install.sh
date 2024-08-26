#!/usr/bin/env bash

### Load file with colors
source ~/projects/dotfiles/configs/shells/.colors.sh

base=`pwd`

__print_dotfile_line() {
  message="${1}"
  echo -e "\n${__BLUE_LIGHT}${message}${__WHITE}"
}

__link_file() {
  file1=${1}
  file2=${2}
  echo -e ""
  ls -la --color=auto $file2
  rm $file2
  echo "[+] Remove file: ${file2}"
  echo "[+] Link file: $file1 => $file2"
  ln -s $file1 $file2
}

# ------------------------------------------------------------------------------

__install_bash() {
  __print_dotfile_line "==> Bash"
  __link_file $base/configs/shells/bash/.bash_profile ~/.bash_profile
  __link_file $base/configs/shells/bash/.bashrc ~/.bashrc
}

__install_zsh() {
  __print_dotfile_line "==> Zsh"
  __link_file $base/configs/shells/zsh/.zprofile ~/.zprofile
  __link_file $base/configs/shells/zsh/.zshrc ~/.zshrc
}

__install_fish() {
  __print_dotfile_line "==> Fish"
  rm -rf ~/.config/fish
  __link_file $base/configs/shells/fish/ ~/.config/fish
}

__install_vim() {
  __print_dotfile_line "==> Vim"
  __link_file $base/configs/.vimrc ~/.vimrc
  mkdir -p ~/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  # vim +PluginInstall +qall
  echo | echo | vim +PluginInstall +qall &>/dev/null
}

__install_git() {
  __print_dotfile_line "==> Git"
  __link_file $base/configs/git/.gitattributes ~/.gitattributes
  __link_file $base/configs/git/.gitconfig ~/.gitconfig
  __link_file $base/configs/git/.gitignore ~/.gitignore
}

__install_tig() {
  __print_dotfile_line "==> Tig"
  __link_file $base/configs/.tigrc ~/.tigrc
}

__install_tmux() {
  __print_dotfile_line "==> Tmux"
  __link_file $base/configs/.tmux.conf ~/.tmux.conf
}

__install_vsc() {
  __print_dotfile_line "==> Visual Studio Code"
  path="$HOME/Library/Application Support/Code/User/"

  if [ -d "${path}" ]; then
    echo -e "Directory ${path} exists\n"
    cp -vR $base/configs/vsc/* "${path}"
  else
    echo -e "Directory ${path} not exists"
  fi
}

__install_fzf() {
  __print_dotfile_line "==> fzf"
  __link_file $base/configs/.fzf.bash ~/.fzf.bash
  __link_file $base/configs/.fzf.zsh ~/.fzf.zsh
}

__install_fastfetch() {
  __print_dotfile_line "==> fastfetch"
  __link_file $base/configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
}

__install_mc() {
  __print_dotfile_line "==> mc"
  __link_file $base/configs/mc/ini ~/.config/mc/ini
}

echo -e "Install configs"

__install_bash
__install_zsh
__install_fish
__install_git
__install_vim
__install_tig
__install_tmux
__install_vsc
__install_fzf
__install_fastfetch
__install_mc
