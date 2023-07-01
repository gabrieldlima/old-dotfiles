function token --wraps='cat $HOME/.config/token | wl-copy' --description 'alias token=cat $HOME/.config/token | wl-copy'
    cat $HOME/.config/token | wl-copy $argv
end
