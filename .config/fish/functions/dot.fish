function dot --wraps='git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME' --description 'alias dot=git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME'
    git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME $argv
end
