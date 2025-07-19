# Public shell aliases

# ------------------------------------------------------------------------------

### Apps with GUI
alias chrome="open -a 'Google Chrome'"
alias p="open -a 'Plain Text Editor'"
alias c="open -a 'Visual Studio Code'"

# ------------------------------------------------------------------------------

### Misc
# alias _='sudo' # not working on Fish
alias b='brew'
alias v='vim'
alias tree='tree --dirsfirst -C'
alias f='find . -not -path "*/node_modules/*" -not -path "*/.git/*" -iname'
alias grep='grep --color=auto'
alias lastfile='find . -type f -print0 | xargs -0 stat -f "%m %N" | sort -rn | head -5 | cut -f2- -d" " | xargs ls -ld' # Get file with last modified time.
alias mode="stat -f '%p %N'"
alias z="code \$(fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}')"
alias rg="rg --glob=!node_modules"
alias exif-clean="exiftool -all= -overwrite_original"

# ------------------------------------------------------------------------------

### Node.js global packages
alias s='npx browser-sync start --server --no-ui --no-open --directory --serveStatic .'
alias sw='s --watch' ## for slides

# ------------------------------------------------------------------------------

### Network (macOS)
alias ip="ifconfig | grep 'inet '" # Print all IP addresses
alias download='wget -L -nv -r -np -e robots=off -m --reject "index.html*"' # Download all content of "Index of /" content
alias https='http --default-scheme=https'
alias open-ports='sudo nmap -sS localhost'

# ------------------------------------------------------------------------------

### Enter to up in structure directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

### Aliases for project directories
alias pro='cd ~/projects/'
alias tmp='cd ~/projects/tmp/'
alias dotfiles='cd ~/projects/dotfiles/'
alias dotfiles-private='cd ~/projects/dotfiles-private/'

# ------------------------------------------------------------------------------

### List directory contents
alias ls='ls -pG --color=auto'
alias ll='ls -hlt'
alias la='ll -A'
alias lld='ls -hAltd'
alias lldw='ls -hAltd www.*'

### Aliases based on other tools
alias lt='lla --timeline'
alias lr='eza -R -L 1 --ignore-glob=node_modules'
alias le='eza -Tx -L 1 --ignore-glob=node_modules'

# ------------------------------------------------------------------------------

### npm
alias ss='npm run start'
alias bb='npm run build'
alias ww='npm run watch'
alias tt='npm run test'
alias ee='npm run e2e'

# ------------------------------------------------------------------------------

### Git
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch -r'
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gcd='git checkout develop'
alias gcm='git checkout main'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff --unified=1'
alias gdd='git -c delta.color-only=false -c delta.side-by-side=true diff --unified=1'
alias gds='gd --staged'
alias gdw='gd --word-diff'
alias gfp='git fetch -p'
alias gk='gitk --all --date-order'
alias gl='git pull --ff-only'
alias gmm='git merge main'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grm='git rebase main'
alias grom='git rebase origin/main'
alias gs='git status -s'
alias gss='gs'
alias gsss='gss'
alias gt='git tag'

### My Git scripts
alias gf='git fire'
alias gpp='git publish-branch'
alias gpu='git projects-update'
alias gpb='git projects-births'
alias gps='git run-on-nested-repos "git status -sb"'
alias gtr='git tags-refresh'

### Official GitHub CLI
alias gpr='gh pr create --fill-first --draft'
