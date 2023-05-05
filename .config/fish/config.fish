if status is-interactive
    # Changing "ls" to "exa"
    alias ls='exa --long --group-directories-first --icons'
    alias ll='exa --long --group-directories-first --icons'
    alias la='exa --long --all --group-directories-first --icons'
    alias lt='exa --long --tree --group-directories-first --icons'

    # Modern Unix tools
    alias cat='bat'
    alias df="duf"

    # Confirm before overwriting something
    alias cp='cp --verbose --interactive'
    alias mv='mv --verbose --interactive'
    alias rm='rm --verbose --interactive'

    # Adding flags
    alias mkdir='mkdir --parents'
    alias rmdir='rmdir --parents'

    # Colorize grep output (good for log files)
    alias grep='grep --color=auto'
    alias diff='diff --color=auto'
    alias tree='tree -C'
    alias ip='ip -color'

    # Neovim (the best text editor ever)
    alias v='nvim'
    alias vi='nvim'
    alias vim='nvim'
    alias nano='nvim'
    alias emacs='nvim'

    # For dotfiles
    alias dot='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME'
    alias token='cat $HOME/.config/token | xclip -selection clipboard'

    # Blazing-fast 🦅starship prompt
    starship init fish | source
end
