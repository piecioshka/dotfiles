#!/usr/bin/env bash

### Resolve the dotfiles repo root from this file's real location (handles symlinks)
export DOTFILES_DIR="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/../../.." && pwd)"

### Location of the private dotfiles (override via env if kept elsewhere)
: "${DOTFILES_PRIVATE_DIR:=$HOME/projects-private/dotfiles-private}"
export DOTFILES_PRIVATE_DIR

### Load file .bashrc first: it runs `brew shellenv`, which puts /opt/homebrew/bin
### in front of PATH, so nvm, python3 and most from the files below win over it
[ -s ~/.bashrc ] && source ~/.bashrc

### Load file with variables
source "$DOTFILES_DIR/configs/shells/__variables.sh"

### Load file with aliases
source "$DOTFILES_DIR/configs/shells/__aliases.sh"
source "$DOTFILES_DIR/configs/shells/__yt-dlp.sh"

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

### Load file .profile
[ -s ~/.profile ] && source ~/.profile

### Load secret config files
[ -s "$DOTFILES_PRIVATE_DIR/.profile" ] && source "$DOTFILES_PRIVATE_DIR/.profile"

### Support rbenv - Ruby Version Manager
[ -s "/opt/homebrew/bin/rbenv" ] && eval "$(rbenv init -)"

### Support pyenv - Python Version Manager
# not initialized in bash: add eval "$(pyenv init -)" to use pyenv shims

### Support fzf
[ -s ~/.fzf.bash ] && source ~/.fzf.bash
