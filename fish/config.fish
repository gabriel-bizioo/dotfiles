if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -e fish_user_paths
set -U fish_user_paths $PATH $HOME/.bin $HOME/.local/bin $HOME/.cargo/bin/

set fish_greeting
set fish_user_keybindings
set C3SL 'gpb21@ssh.c3sl.ufpr.br'
set EDITOR 'nvim'

alias icat='kitten icat'
alias neofetch=fastfetch
alias ls=lsd
alias ll='lsd -alh'
alias cat=bat

starship init fish | source
