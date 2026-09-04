# dotfiles

My public dotfiles: shells (bash, zsh, fish), git, vim, tmux, editors and a few CLI tools.

## Install

```bash
git clone https://github.com/piecioshka/dotfiles.git
cd dotfiles
brew bundle    # CLI tools and fonts from Brewfile (macOS)
bin/install.sh # symlinks configs into place, safe to run again
```

Configs are symlinked from `configs/`, so the repo can live anywhere. Private settings (secrets, work aliases, git identity) load from `DOTFILES_PRIVATE_DIR` (default: `~/projects-private/dotfiles-private`) when it exists.

Then:

- **tmux**: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`, then `prefix + I`
- **Node.js**: install [nvm](https://github.com/nvm-sh/nvm#install-script), then `nvm install stable`
- **iTerm2**: set the profile tagged `Dynamic` as default in Settings → Profiles
- **gh**: `gh extension install dlvhdr/gh-dash`

Fish plugins (fisher, bass) are vendored in the repo, Vim plugins (Vundle) are installed by `install.sh`.

## My scripts

Shell configs add `~/projects/<repo>/bin` to `PATH` for these repos:

```bash
cd ~/projects
for repo in claude-scripts git-scripts github-bash-scripts jira-scripts media-scripts my-binaries my-scripts; do
  git clone "https://github.com/piecioshka/$repo.git"
done
```

## License

[The MIT License](https://piecioshka.mit-license.org) @ 2026
