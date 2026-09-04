# --- basics ---
alias y="yt-dlp"
alias yF="yt-dlp -F"                       # list formats
alias yS="yt-dlp --list-subs"              # list subtitles
alias yi="yt-dlp --skip-download --print '%(title)s | %(duration_string)s | %(uploader)s | %(upload_date)s'"
alias yup="yt-dlp -U"                      # update yt-dlp

# --- video ---
alias mp4="yt-dlp"                         # defaults from config
alias mp4-720="yt-dlp -S 'res:720,vcodec:h264,acodec:aac'"
alias mp4-1080="yt-dlp -S 'res:1080,vcodec:h264,acodec:aac'"
alias mp4-best="yt-dlp -f 'bv*+ba/b' -S 'res,fps,vcodec:av01'"   # max quality, av1/vp9, may not play everywhere
alias mp4-small="yt-dlp -S 'res:720,+size,vcodec:av01'"          # smallest file at 720p

# --- audio ---
alias mp4-pl="yt-dlp -f 'bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a][language=pl]/bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a]/b'"
alias mp4-en="yt-dlp -f 'bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a][language=en]/bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a]/b'"
alias mp3="yt-dlp -x --audio-format mp3 --audio-quality 0"
alias m4a="yt-dlp -f 'ba[ext=m4a]/ba'"

# --- subtitles ---
alias mp4-subs="yt-dlp --write-subs --write-auto-subs -k --embed-subs"          # pl,en from config: embedded and next to the file as srt
alias mp4-subs-pl="yt-dlp --write-subs --write-auto-subs --sub-langs pl -k --embed-subs"
alias mp4-subs-en="yt-dlp --write-subs --write-auto-subs --sub-langs en-orig,en -k --embed-subs"
alias subs="yt-dlp --skip-download --write-subs --write-auto-subs"              # subtitles only, no video

# --- playlists and channels ---
alias ypl="yt-dlp --yes-playlist"
alias ych="yt-dlp --yes-playlist --download-archive ~/.config/yt-dlp/archive.txt"

# --- clip: ycut URL 1:20 2:45 ---
ycut() { yt-dlp --download-sections "*$2-$3" --force-keyframes-at-cuts -o "%(title)s_cut.%(ext)s" "$1"; }
