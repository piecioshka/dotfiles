function webm-to-mp3
    set -l input $argv[1]
    echo "Input: $input"

    set -l output "$argv[1].mp3"
    echo "Output: $output"

    ffmpeg -i "$input" -vn -ab 128k -ar 44100 -y "$output";
end
