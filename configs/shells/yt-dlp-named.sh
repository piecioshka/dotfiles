#!/usr/bin/env bash
# yt-dlp wrapper used by the aliases in __yt-dlp.sh: an optional last argument
# sets the output file name, the extension is added by yt-dlp.
#   mp4 URL                  -> name from the config template
#   mp4 URL my-video         -> my-video.mp4
#   mp3 URL ~/Music/song.mp3 -> ~/Music/song.mp3

if (($# >= 2)); then
  name="${!#}"
  prev="${@:$#-1:1}"
  # the last argument is a name only when it directly follows a URL
  # and is neither an option nor another URL
  if [[ $prev == *://* && $name != -* && $name != *://* ]]; then
    case "$name" in
      *.mp4 | *.mkv | *.webm | *.mp3 | *.m4a) name="${name%.*}" ;;
    esac
    exec yt-dlp "${@:1:$#-1}" -o "${name//%/%%}.%(ext)s"
  fi
fi

exec yt-dlp "$@"
