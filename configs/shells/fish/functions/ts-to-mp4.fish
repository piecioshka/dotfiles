function ts-to-mp4
    set -l input $argv[1]
    echo "Input: $input"

    set -l output "$argv[1].mp4"
    echo "Output: $output"

    ffmpeg -i "$input" -c:v libx264 -c:a aac "$output"
end
