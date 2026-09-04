#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "$script_dir/.." && pwd)"
source "$script_dir/__shared.sh"
source "$root_dir/configs/shells/__colors.sh"

base="$root_dir"

case "$(uname -s)" in
  Linux*) os="linux" ;;
  Darwin*) os="macos" ;;
  CYGWIN*|MINGW*|MSYS*|Windows_NT) os="windows" ;;
  *) os="unknown" ;;
esac

# Link a file or a directory. Safe to run again: a link that already points
# to the source is left alone, anything else in the way is replaced.
function __link_file {
  local source="${1%/}"
  local target="${2%/}"

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    __print_action "Already linked: ${target}"
    return 0
  fi

  mkdir -p "$(dirname "$target")"

  if [ -e "$target" ] || [ -L "$target" ]; then
    rm -rf "$target"
    __print_action "Remove: ${target}"
  fi

  ln -s "$source" "$target"
  __print_action "Link: ${source} => ${target}"
}

# ------------------------------------------------------------------------------

function __install_profile {
  __print_title ".profile"
  __link_file "$base/configs/.profile" ~/.profile
}

function __install_bash {
  __print_title "Bash"
  __link_file "$base/configs/shells/bash/.bash_profile" ~/.bash_profile
  __link_file "$base/configs/shells/bash/.bashrc" ~/.bashrc
}

function __install_zsh {
  __print_title "Zsh"
  __link_file "$base/configs/shells/zsh/.zprofile" ~/.zprofile
  __link_file "$base/configs/shells/zsh/.zshrc" ~/.zshrc
}

function __install_fish {
  __print_title "Fish"
  __link_file "$base/configs/shells/fish" ~/.config/fish
}

function __install_vim {
  __print_title "Vim"
  __link_file "$base/configs/.vimrc" ~/.vimrc

  if [ -d ~/.vim/bundle/Vundle.vim ]; then
    __print_action "Vundle already installed"
  else
    __print_action "Clone Vundle"
    git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi

  if ! command -v vim > /dev/null 2>&1; then
    __print_action "vim not found, skipping plugins"
    return 0
  fi

  # Vundle clones every Plugin 'owner/repo' from .vimrc into ~/.vim/bundle/<repo>
  local plugin missing=0
  while read -r plugin; do
    [ -d "$HOME/.vim/bundle/${plugin##*/}" ] || missing=$((missing + 1))
  done < <(sed -nE "s/^Plugin '([^']+)'.*/\1/p" "$base/configs/.vimrc")

  if [ "$missing" -eq 0 ]; then
    __print_action "Vim plugins already installed"
  else
    __print_action "Install Vim plugins (${missing} missing)"
    vim +PluginInstall +qall < /dev/null > /dev/null 2>&1
  fi
}

function __install_git {
  __print_title "Git"
  __link_file "$base/configs/git/.gitattributes" ~/.gitattributes
  __link_file "$base/configs/git/.gitconfig" ~/.gitconfig
  __link_file "$base/configs/git/.gitignore" ~/.gitignore

  # Platform-specific config is included from ~/.gitconfig-<platform>,
  # because git does not resolve relative include paths through the symlink
  if [ -f "$base/configs/git/.gitconfig-$os" ]; then
    __link_file "$base/configs/git/.gitconfig-$os" ~/.gitconfig-"$os"
  fi
}

function __install_tig {
  __print_title "Tig"
  __link_file "$base/configs/.tigrc" ~/.tigrc
}

function __install_tmux {
  __print_title "Tmux"
  __link_file "$base/configs/.tmux.conf" ~/.tmux.conf
}

# Editors built on VS Code share the config layout; only the app folder differs.
# Usage: __install_vsc_family <display name> <app folder>
function __install_vsc_family {
  local name="$1"
  local dir="$2"
  local path

  __print_title "$name"

  case "$os" in
    linux) path="$HOME/.config/$dir/User" ;;
    macos) path="$HOME/Library/Application Support/$dir/User" ;;
    windows) path="$HOME/AppData/Roaming/$dir/User" ;;
    *) echo "Unknown OS"; return 0 ;;
  esac

  if [ ! -d "$path" ]; then
    echo -e "Directory ${path} not exists (is ${name} installed?)\n"
    return 0
  fi

  __link_file "$base/configs/vsc/snippets" "$path/snippets"
  __link_file "$base/configs/vsc/keybindings.json" "$path/keybindings.json"
  __link_file "$base/configs/vsc/settings.json" "$path/settings.json"
}

function __install_vsc {
  __install_vsc_family "Visual Studio Code" "Code"
}

function __install_cursor {
  __install_vsc_family "Cursor" "Cursor"
}

function __install_windsurf {
  __install_vsc_family "Windsurf" "Windsurf"
}

function __install_zed {
  __print_title "zed"
  __link_file "$base/configs/.config/zed/settings.json" ~/.config/zed/settings.json
}

function __install_fzf {
  __print_title "fzf"
  __link_file "$base/configs/.fzf.bash" ~/.fzf.bash
  __link_file "$base/configs/.fzf.zsh" ~/.fzf.zsh
}

function __install_fastfetch {
  __print_title "fastfetch"
  __link_file "$base/configs/.config/fastfetch" ~/.config/fastfetch
}

function __install_mc {
  __print_title "mc"
  __link_file "$base/configs/.config/mc" ~/.config/mc
}

function __install_btop {
  __print_title "btop"
  __link_file "$base/configs/.config/btop" ~/.config/btop
}

function __install_htop {
  __print_title "htop"
  __link_file "$base/configs/.config/htop" ~/.config/htop
}

function __install_yt_dlp {
  __print_title "yt-dlp"
  __link_file "$base/configs/.config/yt-dlp" ~/.config/yt-dlp
}

function __install_gh_dash {
  __print_title "gh dash"

  if ! command -v gh > /dev/null 2>&1; then
    __print_action "gh not found, skipping"
    return 0
  fi

  if ! gh auth status > /dev/null 2>&1; then
    __print_action "gh is not logged in (run: gh auth login), skipping"
    return 0
  fi

  if gh extension list 2> /dev/null | grep -q "dlvhdr/gh-dash"; then
    __print_action "gh-dash already installed"
  else
    __print_action "Install gh-dash"
    gh extension install dlvhdr/gh-dash
  fi
}

function __install_node {
  __print_title "Node.js"

  if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    __print_action "nvm not found, skipping (install: https://github.com/nvm-sh/nvm#install-script)"
    return 0
  fi

  # shellcheck disable=SC1091
  source "$HOME/.nvm/nvm.sh" --no-use

  if [ "$(nvm version stable)" = "N/A" ]; then
    __print_action "Install Node.js stable"
    nvm install stable
  else
    __print_action "Node.js already installed: $(nvm version stable)"
  fi
}

function __install_iterm {
  __print_title "iTerm2"
  # Dynamic profile: iTerm2 watches this folder and loads profiles from it
  __link_file "$base/configs/iterm/default.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/default.json"
}

echo "Install configs"

case "$os" in
  linux)
    echo "Running on Linux"
    echo "TODO: verify tools"
    ;;
  macos)
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
    __install_windsurf
    __install_zed
    __install_fzf
    __install_fastfetch
    __install_mc
    __install_btop
    __install_htop
    __install_yt_dlp
    __install_iterm
    __install_gh_dash
    __install_node
    ;;
  windows)
    echo "Running on Windows"
    __install_bash
    __install_git
    __install_vim
    __install_vsc
    ;;
  *)
    echo "Unknown OS"
    ;;
esac
