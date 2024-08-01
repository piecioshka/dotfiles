function kill-port
    set port $argv[1]

    if test -z "$port"
        echo "Usage: kill-port <port>"
        return 1
    end

    set -l pid (lsof -t -i:$port)

    if test -n "$pid"
        echo "Port $port is busy by PID $pid"
        kill -9 $pid
        echo "Process $pid killed"
    else
        echo "Port $port is free"
    end
end
