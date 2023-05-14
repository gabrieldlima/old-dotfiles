function ls --wraps='exa --long --group-directories-first --icons' --description 'alias ls=exa --long --group-directories-first --icons'
    exa --long --group-directories-first --icons $argv
end
