#!/usr/bin/env bash

### Load file with variables
source ~/projects/dotfiles/configs/shells/__variables.sh

### Load file with aliases
source ~/projects/dotfiles/configs/shells/__aliases.sh

### Load prompt definition
source ~/projects/dotfiles/configs/shells/bash/.prompt

### Support Angular CLI
source ~/projects/dotfiles/configs/shells/bash/functions/angular-cli.bash

### Support load_nvm
source ~/projects/dotfiles/configs/shells/bash/functions/load_nvm.bash

### Support Bash Completion for Homebrew
source ~/projects/dotfiles/configs/shells/bash/functions/homebrew-completion.bash

### Support command to shorten the prompt
source ~/projects/dotfiles/configs/shells/bash/functions/tiny_prompt.bash

### Load file .bashrc
[ -s ~/.bashrc ] && source ~/.bashrc

### Load file .profile
[ -s ~/.profile ] && source ~/.profile

### Load secret config files
[ -s ~/projects/dotfiles-private/.profile ] && source ~/projects/dotfiles-private/.profile

### Support rbenv - Ruby Version Manager
[ -s "/opt/homebrew/bin/rbenv" ] && eval "$(rbenv init -)"

### Support pyenv - Python Version Manager
# you don't need to do nothing, because pyenv is already available

### Support fzf
[ -s ~/.fzf.bash ] && source ~/.fzf.bash

### Support Cargo (Rust Package Manager)
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
