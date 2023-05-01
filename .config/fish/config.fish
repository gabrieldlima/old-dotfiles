if status is-interactive
    # Aliases
    alias ls='exa --long --group-directories-first --icons'
    alias ll='exa --long --group-directories-first --icons'
    alias la='exa --long --all --group-directories-first --icons'
    alias lt='exa --long --tree --group-directories-first --icons'
    alias cp='cp -v'
    alias mv='mv -v'
    alias rm='rm -v'
    alias mkdir='mkdir -p'
    alias rmdir='rmdir -p'
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias tree='tree -C'
    alias ip='ip -color'
    alias cat='bat'
    alias vi='nvim'
    alias vim='nvim'
    alias df="duf"
    alias lf='lfub'
    alias dot='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME'
    alias token='cat $HOME/.config/token | xclip -selection clipboard'
end

starship init fish | source
