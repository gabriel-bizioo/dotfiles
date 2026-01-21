#
# ~/.bash_profile
#
#If running from tty1/2/3 start sway
[[ "$(tty)" =~  ^/dev/tty[123]$ ]] &&
    export XDG_CURRENT_DESKTOP='sway:wlroots' && exec dbus-run-session sway



[[ -f ~/.bashrc ]] && . ~/.bashrc
export GTK_THEME='Adwaita:dark'

