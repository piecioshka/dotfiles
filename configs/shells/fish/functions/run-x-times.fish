function run-x-times
    set -l x $argv[1]
    set -l command $argv[2]

    echo "[+] Running $x times a command: $command"

    for i in (seq 1 $x)
        eval "$command"
    end
end
