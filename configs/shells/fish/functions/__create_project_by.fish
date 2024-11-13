# Create project by related directory.
function __create_project_by
    set -l name $argv[1]
    set -l type $argv[2]

    # 1. Create new directory
    mkdir $name
    cd $name
    set -l source (pwd)

    echo "[+] Creating: $source"

    # 2. Clone template project and remove Git history
    set -l repo git@github.com:piecioshka/$type.git
    echo "[+] Clonning: $repo"
    git clone $repo --quiet .

    if [ $status -ne 0 ]
        echo 'ERROR: Cloning Git repository failed'
        return 1;
    end

    rm -rf .git/

    # 3. Overwrite INSERT_NAME string
    echo "[+] Replacing: from INSERT_NAME to \"$name\""
    set files README.md package.json package-lock.json index.html src/index.html .changelogrc slides.md bin/cli.js electron-builder.json5

    for FILE in $files
        if [ -s "$FILE" ]
            __replace_file_content "INSERT_NAME" $name $FILE
        end
    end

    # 4. Create Git repository.
    echo "[+] Initializing Git repository"
    git init > /dev/null
    git add .
    git commit -am 'Initialize project' > /dev/null

    set_color brgreen
    echo -e "[+] Project created successfully!"
    set_color normal
end
