function run-on-each-dir
    set -l command $argv[1]
    set_color $fish_color_valid_path
    set_color $fish_color_history_current
    set_color normal

    for d in ./*/
        if test -d "$d"
            set abs_path (realpath "$d")
            set friendly_path (string replace -r "^$HOME" "~" "$abs_path")

            cd "$d"
            echo -n "==> "

            set_color brgreen
            echo -n "$friendly_path"

            set_color brblue
            echo -n " > "

            set_color normal
            echo -e "$command"
            eval "$command"
            cd ".."
            echo ""
        end
    end
end
