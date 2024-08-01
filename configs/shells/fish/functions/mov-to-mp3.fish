function mov-to-mp3
    set -l input $argv[1]
    echo "Input: $input"

    set -l output "$argv[1].mp3"
    echo "Output: $output"

    ffmpeg -i "$input" "$output"
end
