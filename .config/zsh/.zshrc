WORDCHARS='*?_-.[]~=\&;!#%^(){}<>|'

# ENVIRONMENT VARIABLES
source $HOME/.config/zsh/.zprofile

# ZSH OPTIONS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt COMPLETE_ALIASES

# PROMPT
eval "$(starship init zsh)"

# AUTOCOMPLETE
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist

# BINDKEYS
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

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
