# downloading aliases take an optional file name as the last argument: mp4 URL [NAME]
__yt_dlp="$DOTFILES_DIR/configs/shells/yt-dlp-named.sh"

# --- basics ---
alias y="$__yt_dlp"
alias yF="yt-dlp -F"                       # list formats
alias yS="yt-dlp --list-subs"              # list subtitles
alias yi="yt-dlp --skip-download --print '%(title)s | %(duration_string)s | %(uploader)s | %(upload_date>%Y-%m-%d)s'"
alias yup="yt-dlp -U"                      # update yt-dlp

# --- video ---
alias mp4="$__yt_dlp"                      # defaults from config
alias mp4-720="$__yt_dlp -S 'res:720,vcodec:h264,acodec:aac'"
alias mp4-1080="$__yt_dlp -S 'res:1080,vcodec:h264,acodec:aac'"
alias mp4-best="$__yt_dlp -f 'bv*+ba/b' -S 'res,fps,vcodec:av01'"   # max quality, av1/vp9, may not play everywhere
alias mp4-small="$__yt_dlp -f 'bv*+ba/b' -S 'res:720,+size'"        # smallest file at 720p, usually av1, may not play everywhere

# --- audio track language ---
alias mp4-pl="$__yt_dlp -f 'bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a][language=pl]/bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a]/b'"
alias mp4-en="$__yt_dlp -f 'bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a][language=en]/bv*[vcodec^=avc1][ext=mp4]+ba[ext=m4a]/b'"

# --- audio only (-f overrides the video format from config) ---
alias mp3="$__yt_dlp -f 'ba/b' -x --audio-format mp3 --audio-quality 0"
alias m4a="$__yt_dlp -f 'ba[ext=m4a]/ba/b' -x --audio-format m4a"   # aac is copied, other codecs are converted

# --- subtitles (--write-subs keeps the srt files next to the video after embedding) ---
alias mp4-subs="$__yt_dlp --write-subs --write-auto-subs --embed-subs"          # languages from config
alias mp4-subs-pl="$__yt_dlp --write-subs --write-auto-subs --sub-langs pl --embed-subs"
alias mp4-subs-en="$__yt_dlp --write-subs --write-auto-subs --sub-langs en-orig,en --embed-subs"
alias subs="$__yt_dlp --skip-download --write-subs --write-auto-subs"           # subtitles only, no video

# --- playlists and channels ---
alias ypl="yt-dlp --yes-playlist"
alias ych="yt-dlp --yes-playlist --download-archive ~/.local/share/yt-dlp-archive.txt"   # outside the repo, ~/.config/yt-dlp is a symlink to it

# --- clip: ycut URL 1:20 2:45 ---
alias ycut="$DOTFILES_DIR/configs/shells/yt-dlp-cut.sh"
