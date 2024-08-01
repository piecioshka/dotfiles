# Setup fzf

if [ -s /opt/homebrew/opt/fzf ]; then

  if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
  fi

  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null

  # Key bindings
  # ------------
  source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"

fi
