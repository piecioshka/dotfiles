# Get current state of git repo
function __parse_git_state
    set -l state (git status 2>&1 | tee)

    set -l dirty (echo -n "$state" 2> /dev/null | grep "modified:" &> /dev/null; echo "$status")
    set -l untracked (echo -n "$state" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$status")
    set -l ahead (echo -n "$state" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$status")
    set -l newfile (echo -n "$state" 2> /dev/null | grep "new file:" &> /dev/null; echo "$status")
    set -l renamed (echo -n "$state" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$status")
    set -l deleted (echo -n "$state" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$status")
    set -l bits ''

    if [ "$renamed" = "0" ]
        set bits ">$bits"
    end
    if [ "$ahead" = "0" ]
        set bits "*$bits"
    end
    if [ "$newfile" = "0" ]
        set bits "+$bits"
    end
    if [ "$untracked" = "0" ]
        set bits "?$bits"
    end
    if [ "$deleted" = "0" ]
        set bits "x$bits"
    end
    if [ "$dirty" = "0" ]
        set bits "!$bits"
    end
    if [ "$bits" != "" ]
        echo " $bits"
    else
        echo ""
    end
end

# Get current branch and status in git repo
function __parse_git_branch_with_state
    set -l branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

    if [ "$branch" != "" ]
        set -l state (__parse_git_state)
        echo " [$branch$state]"
    else
        echo ""
    end
end

function fish_prompt
    echo -n '(fish) '
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color $fish_color_command
    echo -n (__parse_git_branch_with_state)
    set_color $fish_color_param
    echo -n ' > '
    set_color normal
end

# WARNING: Code below is commented because cause the bug!
# function fish_right_prompt
#     echo (date '+%H:%M:%S')
# end
