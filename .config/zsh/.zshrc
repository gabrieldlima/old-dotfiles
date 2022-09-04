source $HOME/.config/zsh/.zprofile

# AUTO/TAB COMPLETE
autoload -U compinit && compinit

# PROMPT
eval "$(starship init zsh)"

# HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME

# ALIASES
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias token='cat $HOME/.config/token | xclip -selection clipboard'
alias ls='exa -la --group-directories-first --icons'
alias cat='bat'
alias mkdir='mkdir -p'

# PLUGINS
source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
