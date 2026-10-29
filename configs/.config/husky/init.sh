# Loaded by husky before every Git hook. GUI Git clients (VS Code, Tower, etc.)
# start hooks without a login shell, so Node from nvm is missing from PATH and
# hooks fail with "npm: command not found" (code 127).
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh" --no-use
  # Prefer the repo's .nvmrc, fall back to the default alias.
  nvm use --silent >/dev/null 2>&1 || nvm use --silent default >/dev/null 2>&1
fi
