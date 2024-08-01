function mp4-to-mp3
    set -l input $argv[1]
    echo "Input: $input"

    set -l output "$input.mp3"
    echo "Output: $output"

    ffmpeg -i "$input" -q:a 0 -map a "$output"
end
