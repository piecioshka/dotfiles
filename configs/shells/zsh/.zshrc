#!/usr/bin/env zsh

### Load file with variables
source ~/projects/dotfiles/configs/shells/.variables.sh

### Load file with aliases
source ~/projects/dotfiles/configs/shells/.aliases.sh

### Load file function, which are used in aliases
source ~/projects/dotfiles/configs/shells/bash/functions.bash_aliases

### Load prompt definition
source ~/projects/dotfiles/configs/shells/zsh/.prompt

### Support Angular CLI
source ~/projects/dotfiles/configs/shells/bash/angular-cli.bash

### Load secret config files
[ -s ~/projects/dotfiles-private/.profile ] && source ~/projects/dotfiles-private/.profile

### Support fzf
[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh
