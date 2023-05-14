function token --wraps='cat $HOME/.config/token | xclip -selection clipboard' --description 'alias token=cat $HOME/.config/token | xclip -selection clipboard'
    cat $HOME/.config/token | xclip -selection clipboard $argv
end
