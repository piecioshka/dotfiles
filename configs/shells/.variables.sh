# Public shell aliases

### Add my extensions
export PATH="$HOME/projects/git-scripts/:$PATH"
export PATH="$HOME/projects/my-binaries/:$PATH"
export PATH="$HOME/projects/my-scripts/:$PATH"
export PATH="$HOME/projects/npm-scripts/:$PATH"

### GPG
export PATH="/usr/local/opt/gnupg/libexec/gpgbin:$PATH"

### Support Homebrew
export PATH="/usr/local/bin:$PATH"

### Support PHP
export PATH="/usr/local/sbin:$PATH"

### Support rvm
# export PATH="$HOME/.rvm/bin:$PATH"

### Support pip
# export PATH="~/.local/bin:$PATH"

# ------------------------------------------------------------------------------

# Disable default greeting message "The default interactive shell is now zsh."
export BASH_SILENCE_DEPRECATION_WARNING=1

### Setup default editor
if [[ "$(uname)" == 'Darwin' ]]; then
  export EDITOR=code
else
  export EDITOR=vim
fi

### Setup Python
export PYTHON=$(which python3)

### Support ripgrep
export RIPGREP_CONFIG_PATH="$HOME/projects/dotfiles/configs/.ripgreprc"

# Increase default memory for Node.js processes
export NODE_OPTIONS=--max_old_space_size=4096

### Support nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Support most
if command -v most > /dev/null 2>&1; then
    export PAGER="most"
fi
