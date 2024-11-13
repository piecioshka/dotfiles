set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

### Setup default editor
if [ "$(uname)" = 'Darwin' ]
  set -u EDITOR code
else
  set -u EDITOR vim
end

### Disable default greeting message
set fish_greeting

# ------------------------------------------------------------------------------

### Add my extensions
set -gx PATH $HOME/projects/git-browse/ $PATH
set -gx PATH $HOME/projects/git-scripts/ $PATH
set -gx PATH $HOME/projects/my-binaries/ $PATH
set -gx PATH $HOME/projects/my-scripts/ $PATH
set -gx PATH $HOME/projects/npm-scripts/ $PATH

### Support gpg
set -gx PATH /usr/local/opt/gnupg/libexec/gpgbin $PATH

### Support Homebrew
# set -gx PATH $HOME/usr/local/bin $PATH
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

### Support PHP
set -gx PATH $HOME/usr/local/sbin $PATH
# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

### Support rvm - Ruby Version Manager
# set -gx PATH $HOME/.rvm/bin $PATH

### Support uru - Ruby Version Manager
# uru_rt admin install | source

### Suppport rbenv - Ruby Version Manager
[ -s "/opt/homebrew/bin/rbenv" ] && status --is-interactive; and rbenv init - fish | source

### Support ripgrep
set -gx RIPGREP_CONFIG_PATH $HOME/projects/dotfiles/configs/.ripgreprc

### Support pyenv - Python Version Manager
[ -s "/opt/homebrew/bin/pyenv" ] && status --is-interactive; and source (pyenv init -|psub)

# Resolve an issue:
# $ fish: Unknown command: python
set -gx PATH $(brew --prefix python@3)/libexec/bin $PATH
set -gx PYTHON $(which python3)

# Increase default memory for Node.js processes
set -gx NODE_OPTIONS "--max_old_space_size=4096"

# ------------------------------------------------------------------------------

### Load file with aliases
source ~/projects/dotfiles/configs/shells/.aliases.sh

### Load file function, which are used in aliases
# bass source ~/projects/dotfiles/configs/shells/bash/functions.bash_aliases

### Support Angular CLI
bass source ~/projects/dotfiles/configs/shells/bash/angular-cli.bash

### Load secret config files
[ -s "$HOME/projects/dotfiles-private/.profile" ] && bass source ~/projects/dotfiles-private/.profile

# ------------------------------------------------------------------------------

# https://github.com/nvm-sh/nvm#fish
# You must call it on initialization or listening to directory switching won't work
load_nvm > /dev/stderr
