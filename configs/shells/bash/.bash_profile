#!/usr/bin/env bash

### Load file with variables
source ~/projects/dotfiles/configs/shells/.variables.sh

### Load file with aliases
source ~/projects/dotfiles/configs/shells/.aliases.sh

### Load file function, which are used in aliases
source ~/projects/dotfiles/configs/shells/bash/functions.bash_aliases

### Load prompt definition
source ~/projects/dotfiles/configs/shells/bash/.prompt

### Support Angular CLI
source ~/projects/dotfiles/configs/shells/bash/angular-cli.bash

### Load file .bashrc
[ -s ~/.bashrc ] && source ~/.bashrc

### Load file .profile
[ -s ~/.profile ] && source ~/.profile

### Load secret config files
[ -s ~/projects/dotfiles-private/.profile ] && source ~/projects/dotfiles-private/.profile

### Support rvm - Ruby Version Manager
# [ -s ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm

### Support uru - Ruby Version Manager
# eval "$(uru_rt admin install)"

### Suppport rbenv - Ruby Version Manager
[ -s "/opt/homebrew/bin/rbenv" ] && eval "$(rbenv init -)"

### Support fzf
[ -s ~/.fzf.bash ] && source ~/.fzf.bash

### Support Cargo (Rust Package Manager)
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
