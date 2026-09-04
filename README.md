# dotfiles

My public dotfiles: shells (bash, zsh, fish), git, vim, tmux, editors and a few CLI tools.

## Install

```bash
git clone https://github.com/piecioshka/dotfiles.git
cd dotfiles
bin/install.sh
```

The script symlinks every config from `configs/` into the place its tool expects (`~/.zshrc`, `~/.config/fish`, `~/.gitconfig`, the `User/` folder of VS Code, Cursor and Windsurf, an iTerm2 dynamic profile, ...). The repo can live anywhere: shell entry files resolve its location from their own symlink. Running it again is safe, links that already point into the repo are left alone and anything else in the way is replaced.

Private settings (secrets, work aliases, git identity) live in a separate repo and are loaded from `DOTFILES_PRIVATE_DIR` (default: `~/projects-private/dotfiles-private`). A missing directory is ignored.

### After install

- **Fish**: `fisher` and the `bass` plugin are vendored in `configs/shells/fish/functions/`, so a fresh machine needs no extra step. `fisher update` refreshes plugins listed in `fish_plugins`.
- **tmux**: install [tpm](https://github.com/tmux-plugins/tpm) with `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`, then press `prefix + I` inside tmux.
- **Vim**: `install.sh` clones [Vundle](https://github.com/VundleVim/Vundle.vim) and runs `:PluginInstall`.
- **iTerm2**: the profile from `configs/iterm/default.json` appears in Settings → Profiles with the `Dynamic` tag. Set it as default there and drop the built-in one.
- **Node.js**: install [nvm](https://github.com/nvm-sh/nvm#install-script), then `nvm install stable`. Shells switch versions automatically from `.nvmrc`.

## Required software

<details>
<summary>macOS</summary>

```bash
brew install watch
brew install tree
brew install mc
brew install fzf
brew install bat
brew install ripgrep # shell command: rg
brew install btop
brew install htop
brew install fastfetch # shell commands: fastfetch, flashfetch
brew install httpie # shell command: http
brew install nmap
brew install tmux
brew install most # pager, used when available
brew install wget # shell alias: download
brew install exiftool # shell alias: exif-clean

brew install git # NOTE: macOS built-in version is always older
brew install git-gui # shell command: gitk
brew install git-delta # https://github.com/dandavison/delta
brew install difftastic # shell command: difft - https://github.com/Wilfred/difftastic
brew install tig # https://github.com/jonas/tig
brew install gh # https://github.com/cli/cli

brew install rbenv # https://github.com/rbenv/rbenv
brew install pyenv # https://github.com/pyenv/pyenv
brew install lla # https://github.com/triyanox/lla
brew install eza # https://github.com/eza-community/eza

brew install ncdu # https://dev.yorhel.nl/ncdu - NCurses Disk Usage
brew install entr # https://github.com/eradman/entr/ - run arbitrary commands when files change
brew install yt-dlp # https://github.com/yt-dlp/yt-dlp
```

```bash
gh extension install dlvhdr/gh-dash # shell command: gh dash
brew install --cask font-fira-code-nerd-font # then set "FiraCode Nerd Font" as default font in terminal
```

</details>

## Install my custom scripts

```bash
cd ~/projects/
git clone https://github.com/piecioshka/claude-scripts.git
git clone https://github.com/piecioshka/git-scripts.git
git clone https://github.com/piecioshka/github-bash-scripts.git
git clone https://github.com/piecioshka/jira-scripts.git
git clone https://github.com/piecioshka/media-scripts.git
git clone https://github.com/piecioshka/my-binaries.git
git clone https://github.com/piecioshka/my-scripts.git
```

## License

[The MIT License](https://piecioshka.mit-license.org) @ 2026
