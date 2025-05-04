if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x MANPAGER "nvim +Man!"
set -e fish_user_paths
set -U fish_user_paths $PATH $HOME/.bin $HOME/.local/bin $HOME/.cargo/bin/

set fish_greeting
set fish_user_keybindings
set C3SL 'gpb21@ssh.c3sl.ufpr.br'
set EDITOR 'nvim'
set ufpr $HOME'/Documents/ufpr/'

alias icat='kitten icat'
alias neofetch=fastfetch
alias ls=lsd
alias ll='lsd -alh'
alias cat=bat
alias lsz='dua'
alias ...='cd ../..'
alias ....='cd ../../..'

starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/bizio/miniconda3/bin/conda
    eval /home/bizio/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/bizio/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/bizio/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/bizio/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

