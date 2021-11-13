#!/bin/sh
# xinitrc


onStart()
{

    # load xresources
    xresources=$HOME/.Xresources

    if [ -f "$xresources" ]; then
        xrdb -merge "$xresources"

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

    xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate right\
            --output DVI-D-1 --mode 1920x1080 --pos 1093x0 --rotate right\
            --output DP-1 --primary --mode 2560x1440 --pos 2173x0 --rate 144.00\
            --output DP-3 --mode 1280x1024 --pos 2750x-1440 & 

    # terminal
    alacritty &

    firefox &
    discord &

    xscreensaver -no-splash &

    exec i3
}


# execute
onStart
