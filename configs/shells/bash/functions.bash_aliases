#!/usr/bin/env bash

__set_color() {
    echo -en ${1}
}

# Extract functions from .aliases.sh (fish has different syntax than bash)

# ------------------------------------------------------------------------------
#
# Replace content in passed filename.
__replace_file_content() {
    from="${1}"
    to="${2}"
    filename="${3}"
    input="s/${from}/${to}/g";
    suffix="-new"

    sed -i ${suffix} ${input} ${filename}
    rm "${filename}${suffix}"
}

# ------------------------------------------------------------------------------
#
# Create project by related directory.
__create_project_by() {
    name="${1}";
    type="${2}";

    # 1. Create new directory
    mkdir ${name}

    # INFO: $? reads the exit status of the last command executed
    # http://tldp.org/LDP/abs/html/exit-status.html
    if [ $? -ne 0 ]; then
        echo 'ERROR: Cloning Git repository failed'
        return $?
    fi

    cd ${name}

    homedir=~
    eval homedir=${homedir} # workaround for translate ~ to user home directory
    source="$(pwd)"

    echo "[+] Creating: $source"

    # 2. Clone template project and remove Git history
    repo=git@github.com:piecioshka/${type}.git
    echo "[+] Clonning: $repo"
    git clone $repo --quiet .
    rm -rf .git/

    # 3. Overwrite INSERT_NAME string
    echo "[+] Replacing: from INSERT_NAME to \"$name\""
    files=(README.md package.json package-lock.json index.html src/index.html .changelogrc slides.md bin/cli.js electron-builder.json5)

    for FILE in ${files[*]}
    do
        if [ -s "${FILE}" ]; then
            __replace_file_content "INSERT_NAME" ${name} ${FILE}
        fi
    done

    # 4. Create Git repository
    echo "[+] Initializing Git repository"
    git init > /dev/null
    git add .
    git commit -am 'Initialize project' > /dev/null

    __set_color "${__COLOR_GREEN}"
    echo -e "[+] Project created successfully!"
    __set_color "${__COLOR_RESET}"
}

# ------------------------------------------------------------------------------
#
# Create new project.
__new_project() {
    : ${1? "Usage: new-project PROJECT_NAME"}
    __create_project_by ${1} 'template-project'
}

alias new-project=__new_project

# ------------------------------------------------------------------------------
#
# Create new slides.
__new_slides() {
    : ${1? "Usage: new-slides SLIDES_TITLE"}
    __create_project_by ${1} 'template-slides'
}

alias new-slides=__new_slides

# ------------------------------------------------------------------------------
#
# Create new guide.
__new_guide() {
    : ${1? "Usage: new-guide GUIDE_TITLE"}
    __create_project_by ${1} 'template-guide'
}

alias new-guide=__new_guide

# ------------------------------------------------------------------------------
#
# Create new macOS app.
__new_macos_app() {
    : ${1? "Usage: new-macos-app APP_NAME"}
    __create_project_by ${1} 'template-macos-app'
}

alias new-macos-app=__new_macos_app

# ------------------------------------------------------------------------------
#
# Create new React app.
__new_react_app() {
    : ${1? "Usage: new-react-app APP_NAME"}
    __create_project_by ${1} 'template-react-app'
}

alias new-react-app=__new_react_app

# ------------------------------------------------------------------------------
#
# Run passed command to each child directory.
__run_on_each_dir() {
    command="${1}"

    for d in ./*/
    do
        if [ -d "$d" ]; then
            cd "$d"
            echo -n "==> "
            __set_color "${__COLOR_GREEN}"
            echo -n "$d"
            __set_color "${__COLOR_BLUE}"
            echo -n " > "
            __set_color "${__COLOR_RESET}"
            echo -e "$command"
            eval "$command"
            cd ".."
            echo ""
        fi
    done
}

alias run-on-each-dir=__run_on_each_dir

# ------------------------------------------------------------------------------
#
# Display what is happen in repository in that moment.
__what_happened() {
    watch -n 5 --color "git status -sb"
}

alias what-happened=__what_happened

# ------------------------------------------------------------------------------
#
# Git refresh tags (remove all local tags and fetch from origin).
__git_tags_refresh() {
    git tag -l | xargs git tag -d
    git fetch
}

alias gtr=__git_tags_refresh

# ------------------------------------------------------------------------------
#
# Git push branch to origin with the same name.
__git_publish_branch() {
    branch="$(git rev-parse --abbrev-ref HEAD)"
    echo -e 'Track your local branch to remove: '$branch
    git push -u origin "${branch}"
}

alias gpp=__git_publish_branch

# ------------------------------------------------------------------------------
#
# Convert MP4 to 3GP
__mp4_to_3gp() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg  -y -i ${1} \
        -r 10 -s 176x144 -vb 400k \
        -acodec aac -strict experimental -ac 1 -ar 8000 -ab 24k \
        ${2}
}

alias mp4-to-3gp=__mp4_to_3gp

# ------------------------------------------------------------------------------
#
# Convert FLV to MP4
__flv_to_mp4() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg -i "${1}" -codec copy "${2}"
}

alias flv-to-mp4=__flv_to_mp4

# ------------------------------------------------------------------------------
#
# Convert MKV to MP4
__mkv_to_mp4() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg -i "${1}" -codec copy "${2}"
}

alias mkv-to-mp4=__mkv_to_mp4

# ------------------------------------------------------------------------------
#
# Convert MOV to MP4
__mov_to_mp4() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg -i "${1}" -vcodec h264 -acodec ac3_fixed "${2}"
}

alias mov-to-mp4=__mov_to_mp4

# ------------------------------------------------------------------------------
#
# Convert MP4 to MOV
__mp4_to_mov() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg -i "${1}" -f mov "${2}"
}

alias mp4-to-mov=__mp4_to_mov

# ------------------------------------------------------------------------------
#
# Convert MP4 to MP3
__mp4_to_mp3() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg -i "${1}" -q:a 0 -map a "${2}"
}

alias mp4-to-mp3=__mp4_to_mp3

# ------------------------------------------------------------------------------
#
# Convert MOV to MP3
__mov_to_mp3() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg -i "${1}" "${2}"
}

alias mov-to-mp3=__mov_to_mp3

# ------------------------------------------------------------------------------
#
# Convert TS to MP4
__ts_to_mp4() {
    echo "Source: ${1}"
    echo "Target: ${2}\n"
    ffmpeg -i "${1}" -c:v libx264 -c:a aac "${2}"
}

alias ts-to-mp4=__ts_to_mp4
