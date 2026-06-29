#!/usr/bin/env zsh

setopt EXTENDED_HISTORY

### Resolve the dotfiles repo root from this file's real location (handles symlinks)
export DOTFILES_DIR="${${(%):-%N}:A:h:h:h:h}"

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
[ -s ~/projects-private/dotfiles-private/.profile ] && source ~/projects-private/dotfiles-private/.profile

### Support fzf
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh
