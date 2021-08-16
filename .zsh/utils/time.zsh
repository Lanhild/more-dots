function zsh_command_time {
  if [ -n "$ZSH_COMMAND_TIME" ]; then
    local hours=$(($ZSH_COMMAND_TIME/3600))
    local min=$(($ZSH_COMMAND_TIME/60))
    local sec=$(($ZSH_COMMAND_TIME%60))
    if [ "$ZSH_COMMAND_TIME" -le 1 ]; then
      _kyoto[COMMAND_TIME]=""
    elif [ "$ZSH_COMMAND_TIME" -le 60 ]; then
      _kyoto[COMMAND_TIME]="${ZSH_COMMAND_TIME}s "
    elif [ "$ZSH_COMMAND_TIME" -gt 60 ] && [ "$ZSH_COMMAND_TIME" -le 180 ]; then
      _kyoto[COMMAND_TIME]="${min}min ${sec}s "
    else
      if [ "$hours" -gt 0 ]; then
        min=$(($min%60))
        _kyoto[COMMAND_TIME]="%B$_kyoto[RED]${hours}h%b$_kyoto[GRAY] ${min}min ${sec}s "
      else
        _kyoto[COMMAND_TIME]="${min}min ${sec}s "
      fi
    fi
  fi
}