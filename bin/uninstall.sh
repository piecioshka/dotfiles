#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "$script_dir/.." && pwd)"
source "$script_dir/__shared.sh"
source "$root_dir/configs/shells/__colors.sh"

base="$root_dir"

# Remove a link created by install.sh. Only a link that points to the source
# is removed, so files in the repo and files not managed here stay untouched.
function __unlink_file {
  local source="${1%/}"
  local target="${2%/}"

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    rm "$target"
    __print_action "Remove: ${target}"
  else
    __print_action "Not linked, skipping: ${target}"
  fi
}

# ------------------------------------------------------------------------------
# Mirrors install.sh. Installed software (Vim plugins, gh dash, Node.js,
# yazi plugins) stays in place.

function __remove_profile {
  __print_title ".profile"
  __unlink_file "$base/configs/.profile" ~/.profile
}

function __remove_bash {
  __print_title "Bash"
  __unlink_file "$base/configs/shells/bash/.bash_profile" ~/.bash_profile
  __unlink_file "$base/configs/shells/bash/.bashrc" ~/.bashrc
}

function __remove_zsh {
  __print_title "Zsh"
  __unlink_file "$base/configs/shells/zsh/.zprofile" ~/.zprofile
  __unlink_file "$base/configs/shells/zsh/.zshrc" ~/.zshrc
}

function __remove_fish {
  __print_title "Fish"
  __unlink_file "$base/configs/shells/fish" ~/.config/fish
}

function __remove_vim {
  __print_title "Vim"
  __unlink_file "$base/configs/.vimrc" ~/.vimrc
}

function __remove_git {
  __print_title "Git"
  __unlink_file "$base/configs/git/.gitattributes" ~/.gitattributes
  __unlink_file "$base/configs/git/.gitconfig" ~/.gitconfig
  __unlink_file "$base/configs/git/.gitignore" ~/.gitignore
  __unlink_file "$base/configs/git/.gitconfig-$os" ~/.gitconfig-"$os"
}

function __remove_tig {
  __print_title "Tig"
  __unlink_file "$base/configs/.tigrc" ~/.tigrc
}

function __remove_tmux {
  __print_title "Tmux"
  __unlink_file "$base/configs/.tmux.conf" ~/.tmux.conf
}

# Usage: __remove_vsc_family <display name> <app folder>
function __remove_vsc_family {
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

  __unlink_file "$base/configs/vsc/snippets" "$path/snippets"
  __unlink_file "$base/configs/vsc/keybindings.json" "$path/keybindings.json"
  __unlink_file "$base/configs/vsc/settings.json" "$path/settings.json"
}

function __remove_vsc {
  __remove_vsc_family "Visual Studio Code" "Code"
}

function __remove_cursor {
  __remove_vsc_family "Cursor" "Cursor"
}

function __remove_windsurf {
  __remove_vsc_family "Windsurf" "Windsurf"
}

function __remove_zed {
  __print_title "zed"
  __unlink_file "$base/configs/.config/zed/settings.json" ~/.config/zed/settings.json
}

function __remove_fzf {
  __print_title "fzf"
  __unlink_file "$base/configs/.fzf.bash" ~/.fzf.bash
  __unlink_file "$base/configs/.fzf.zsh" ~/.fzf.zsh
}

function __remove_fastfetch {
  __print_title "fastfetch"
  __unlink_file "$base/configs/.config/fastfetch" ~/.config/fastfetch
}

function __remove_mc {
  __print_title "mc"
  __unlink_file "$base/configs/.config/mc" ~/.config/mc
}

function __remove_yazi {
  __print_title "yazi"
  __unlink_file "$base/configs/.config/yazi" ~/.config/yazi
}

function __remove_btop {
  __print_title "btop"
  __unlink_file "$base/configs/.config/btop" ~/.config/btop
}

function __remove_htop {
  __print_title "htop"
  __unlink_file "$base/configs/.config/htop" ~/.config/htop
}

function __remove_yt_dlp {
  __print_title "yt-dlp"
  __unlink_file "$base/configs/.config/yt-dlp" ~/.config/yt-dlp
}

function __remove_iterm {
  __print_title "iTerm2"
  __unlink_file "$base/configs/iterm/default.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/default.json"
}

echo "Remove configs"

case "$os" in
  linux)
    echo "Running on Linux"
    echo "TODO: verify tools"
    ;;
  macos)
    echo "Running on macOS"
    __remove_profile
    __remove_bash
    __remove_zsh
    __remove_fish
    __remove_git
    __remove_vim
    __remove_tig
    __remove_tmux
    __remove_vsc
    __remove_cursor
    __remove_windsurf
    __remove_zed
    __remove_fzf
    __remove_fastfetch
    __remove_mc
    __remove_yazi
    __remove_btop
    __remove_htop
    __remove_yt_dlp
    __remove_iterm
    ;;
  windows)
    echo "Running on Windows"
    __remove_bash
    __remove_git
    __remove_vim
    __remove_vsc
    ;;
  *)
    echo "Unknown OS"
    ;;
esac
