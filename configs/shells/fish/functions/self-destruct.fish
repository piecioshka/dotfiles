function self-destruct --description='Remove current directory with all files inside'
    set -l name (basename (pwd))

    read -p "set_color yellow; echo -ne 'Are you sure you want to delete \"$name\" directory? [y/N]: '; set_color normal;" choice

    switch $choice
        case "y" "Y"
          cd ..
          rm -rfv $name
          set_color green
          echo -e "Directory \"$name\" was removed successful!"
          set_color normal

        case "*"
          set_color red
          echo -e "ERROR: Process was canceled"
          set_color normal
    end
end
