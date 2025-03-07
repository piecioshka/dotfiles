#!/usr/bin/env zsh

### Load file with variables
source ~/projects/dotfiles/configs/shells/__variables.sh

### Load file with aliases
source ~/projects/dotfiles/configs/shells/__aliases.sh

### Load prompt definition
source ~/projects/dotfiles/configs/shells/zsh/.prompt

### Support Angular CLI
source ~/projects/dotfiles/configs/shells/bash/angular-cli.bash

### Support load_nvm
source ~/projects/dotfiles/configs/shells/zsh/load_nvm.zsh

### Support Zsh Completion for Homebrew
source ~/projects/dotfiles/configs/shells/zsh/homebrew-completion.zsh

### Load file .profile
[ -s ~/.profile ] && source ~/.profile

### Load secret config files
[ -s ~/projects/dotfiles-private/.profile ] && source ~/projects/dotfiles-private/.profile

### Support fzf
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh
