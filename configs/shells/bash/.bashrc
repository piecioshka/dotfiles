### Support Homebrew
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

### Support Cargo (Rust Package Manager)
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
