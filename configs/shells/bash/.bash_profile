#!/usr/bin/env bash

### Resolve the dotfiles repo root from this file's real location (handles symlinks)
export DOTFILES_DIR="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/../../.." && pwd)"

### Load file with variables
source "$DOTFILES_DIR/configs/shells/__variables.sh"

### Load file with aliases
source "$DOTFILES_DIR/configs/shells/__aliases.sh"

### Load prompt definition
source "$DOTFILES_DIR/configs/shells/bash/.prompt"

### Support Angular CLI
source "$DOTFILES_DIR/configs/shells/bash/functions/angular-cli.bash"

### Support load_nvm
source "$DOTFILES_DIR/configs/shells/bash/functions/load_nvm.bash"

### Support Bash Completion for Homebrew
source "$DOTFILES_DIR/configs/shells/bash/functions/homebrew-completion.bash"

### Support command to shorten the prompt
source "$DOTFILES_DIR/configs/shells/bash/functions/tiny_prompt.bash"

### Load file .bashrc
[ -s ~/.bashrc ] && source ~/.bashrc

### Load file .profile
[ -s ~/.profile ] && source ~/.profile

### Load secret config files
[ -s ~/projects-private/dotfiles-private/.profile ] && source ~/projects-private/dotfiles-private/.profile

### Support rbenv - Ruby Version Manager
[ -s "/opt/homebrew/bin/rbenv" ] && eval "$(rbenv init -)"

### Support pyenv - Python Version Manager
# you don't need to do nothing, because pyenv is already available

### Support fzf
[ -s ~/.fzf.bash ] && source ~/.fzf.bash

### Support Cargo (Rust Package Manager)
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
