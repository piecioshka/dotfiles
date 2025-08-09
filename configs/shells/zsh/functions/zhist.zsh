# This function, `zhist`, searches the Zsh command history for a specific keyword.
# It uses the `fc` command to list the history with timestamps in the format "YYYY-MM-DD HH:MM:SS".
# The output is filtered using `grep` to match the provided case-insensitive keyword.
#
# Usage:
#   zhist <keyword>
#
# Example:
#   zhist git
#   # This will display all history entries containing the word "git".
zhist() {
  fc -l -t "%F %T" 1 | grep -i "$1";
}
