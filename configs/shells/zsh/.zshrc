#!/usr/bin/env zsh

setopt EXTENDED_HISTORY

### Resolve the dotfiles repo root from this file's real location (handles symlinks)
export DOTFILES_DIR="${${(%):-%N}:A:h:h:h:h}"

### Location of the private dotfiles (override via env if kept elsewhere)
: "${DOTFILES_PRIVATE_DIR:=$HOME/projects-private/dotfiles-private}"
export DOTFILES_PRIVATE_DIR

### Load file with variables
source "$DOTFILES_DIR/configs/shells/__variables.sh"

### Load file with aliases
source "$DOTFILES_DIR/configs/shells/__aliases.sh"

### Load prompt definition
source "$DOTFILES_DIR/configs/shells/zsh/.prompt"

### Support Angular CLI (from bash)
source "$DOTFILES_DIR/configs/shells/bash/functions/angular-cli.bash"

### Support load_nvm
source "$DOTFILES_DIR/configs/shells/zsh/functions/load_nvm.zsh"

### Support Zsh Completion for Homebrew
source "$DOTFILES_DIR/configs/shells/zsh/functions/homebrew-completion.zsh"

### Support timestamps for all executed commands
source "$DOTFILES_DIR/configs/shells/zsh/functions/zhist.zsh"

### Load file .profile
[ -s ~/.profile ] && source ~/.profile

### Load secret config files
[ -s "$DOTFILES_PRIVATE_DIR/.profile" ] && source "$DOTFILES_PRIVATE_DIR/.profile"

### Support fzf
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh
