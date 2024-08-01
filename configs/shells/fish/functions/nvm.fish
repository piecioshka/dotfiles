# https://github.com/nvm-sh/nvm#fish
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
