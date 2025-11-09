if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x MANPAGER "nvim +Man!"

if not contains $HOME/.bin $fish_user_paths
    set -U fish_user_paths $PATH $HOME/.bin $HOME/.local/bin $HOME/.cargo/bin/
end

set fish_greeting

set EDITOR 'nvim'
set ufpr $HOME'/Documents/ufpr/'

alias rmdir=trash
alias icat='kitten icat'
alias neofetch=fastfetch
alias ls=lsd
alias cd=z
alias ll='lsd -l'
alias cat=bat
alias lsz='dua'
alias ...='cd ../..'
alias ....='cd ../../..'
bind --mode normal tab 'complete'

starship init fish | source
zoxide init fish | source
