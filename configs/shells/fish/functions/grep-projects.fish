function grep-projects
    set -l current (pwd)
    cd ~
    rg -F $argv[1] --iglob "!node_modules" --iglob "!.git" projects*
    cd $current
end
