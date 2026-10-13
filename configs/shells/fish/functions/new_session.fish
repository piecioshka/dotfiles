# Create a new file in ~/.local/share/fish/<filename>_history
function new_session
  set -g fish_history temp_recording_(date "+%Y_%m_%d_%H_%M_%S")
end
