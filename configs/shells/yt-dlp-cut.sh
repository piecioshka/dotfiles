#!/usr/bin/env bash
# Downloads a fragment of a video: ycut URL 1:20 2:45
# A script, not a shell function, so that fish (through bass) sees it as well.

if (($# != 3)); then
  echo "usage: ycut URL START END" >&2
  exit 1
fi

exec yt-dlp --download-sections "*$2-$3" --force-keyframes-at-cuts -o "%(title).150B_cut.%(ext)s" "$1"
