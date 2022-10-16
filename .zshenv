export ZDOTDIR=$HOME/.config/zsh
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

export KEYTIMEOUT=1

export BROWSER='brave'
export EDITOR='nvim'
export TERMINAL='alacritty'
export TERM='xterm-256color'

export HISTFILE=$HOME/.config/zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export PATH="$HOME/.local/bin/:$PATH"

export FZF_DEFAULT_COMMAND="fd --type=file --strip-cwd-prefix --hidden --follow --exclude '.git'"
export FZF_DEFAULT_OPTS="--layout=reverse --no-height --info=hidden --border=sharp --preview='pistol {}' --preview-window=sharp --color=16"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_ALT_C_COMMAND="fd --type=directory --strip-cwd-prefix --hidden --follow --exclude '.git'"
export FZF_ALT_C_OPTS="--layout=reverse --no-height --info=hidden --border=sharp --preview='tree -C {}' --preview-window=sharp --color=16"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XINITRC="$XDG_CONFIG_HOME"/x11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE="-"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOPATH="$XDG_DATA_HOME"/go
