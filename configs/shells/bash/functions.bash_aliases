#!/usr/bin/env bash

# Extract functions from .aliases.sh (fish has different syntax than bash)

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
