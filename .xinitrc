#!/bin/sh
# xinitrc


onStart ()
{
    userresources=$HOME/.Xresources

    # merge in defaults and keymaps
    if [ -f "$userresources" ]; then
        xrdb -merge "$userresources"

    fi


    # start some nice programs
    if [ -d /etc/X11/xinit/xinitrc.d ] ; then
        for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
            [ -x "$f" ] && . "$f"
        done
        unset f
    fi


    # xset man page: https://linux.die.net/man/1/xset
    xset r rate 200 60
    xset m 2 0

    # Two screens
    xrandr --fb 4800x1950 --output DVI-D-1 --mode 1920x1080 --pos 1080x0 --rotate right --output DP-1 --primary --mode 2560x1440 --pos 2160x0 --rotate normal &

    # terminal
    alacritty &

    firefox &
    discord &

    exec i3
}


# execute
onStart

