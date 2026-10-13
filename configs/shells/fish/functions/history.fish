### Support timestamps for all executed commands
function history
    if test (count $argv) -eq 0
        builtin history --show-time='%F %T '
    else
        builtin history $argv
    end
end
