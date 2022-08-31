source $HOME/.config/zsh/.zprofile

# VI MODE
bindkey -v

# PROMPT
eval "$(starship init zsh)"

# HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
