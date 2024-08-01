function gpp
    set -l branch (git rev-parse --abbrev-ref HEAD)
    echo -e 'Track your local branch to remove: '$branch
    git push -u origin $branch
end
