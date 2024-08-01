function __replace_file_content
    set -l from $argv[1]
    set -l to $argv[2]
    set -l filename $argv[3]

    set -l input "s/$from/$to/g"
    set -l suffix "-new"

    sed -i $suffix $input $filename
    rm "$filename$suffix"
end
