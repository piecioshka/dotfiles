# https://stackoverflow.com/a/47512301/1204375
# ffmpeg -i input.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus output.webm

function webm-to-mp4
    set -l input $argv[1]
    echo "Input: $input"

    set -l output "$argv[1].mp4"
    echo "Output: $output"

    ffmpeg -i "$input" -c:v libvpx-vp9 -crf 30 -b:v 0 -b:a 128k -c:a libopus "$output"
end
