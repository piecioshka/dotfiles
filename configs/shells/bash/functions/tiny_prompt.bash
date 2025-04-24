tiny_prompt() {
  export PS1="(bash) ${__COLOR_GREEN}\$(basename \w)${__COLOR_CYAN}\`__parse_git_state\`${__COLOR_BLUE_LIGHT} > ${__COLOR_RESET}"
}
