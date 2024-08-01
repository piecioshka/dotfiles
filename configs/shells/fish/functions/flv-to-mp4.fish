function flv-to-mp4
    set -l input $argv[1]
    echo "Input: $input"

    set -l output "$argv[1].mp4"
    echo "Output: $output"

    ffmpeg -i "$input" -codec copy "$output"
end
