function mp4-to-mov
    set -l input $argv[1]
    echo "Input: $input"

    set -l output "$argv[1].mov"
    echo "Output: $output"

    ffmpeg -i "$input" -f mov "$output"
end
