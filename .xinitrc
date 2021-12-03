#!/bin/sh

onStart()
{
    # gotta start these
    if [ -d /etc/X11/xinit/xinitrc.d ] ; then
        for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
            [ -x "$f" ] && . "$f"
        done
        unset f
    fi


    xresources=$HOME/.Xresources
    if [ -f "$xresources" ]
    then
        xrdb -merge "$xresources"
    fi


    # xset man page: https://linux.die.net/man/1/xset
    xset r rate 170 90
    xset m 2 0


    # ubuntu thinks that we can set the rate for our top monitor higher. Investigate
    xrandr --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate right\
            --output DVI-D-0 --mode 1920x1080 --pos 1093x0 --rotate right\
            --output DisplayPort-0 --primary --mode 2560x1440 --pos 2173x0 --rate 144.00\
            --output DisplayPort-2  --mode 1280x1024 --pos 2750x-1440 &



    unclutter &
    xscreensaver -no-splash &
    alacritty &
    firefox &
    discord &

    exec i3
}

onStart
