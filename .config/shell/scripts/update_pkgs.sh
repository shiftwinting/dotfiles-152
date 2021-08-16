#!/bin/sh
    
# Notes:
#   - original @ https://gist.github.com/yangl1996/44349cd3317be844e7dcfc60c0a05863
#   - "won't handle situations where /var/log/pacman.log doesn't exist or full system upgrade not run once"


main()
{
    if test $# -ne 0
    then
        sudo pacman -S "$@"
    else
        current_utime=$(date '+%s') 
        printf '\n'

        print_pacman_update_time
        printf '\n'

        exe_menus 
    fi
}


exe_menus()
{
    read -p "Check Arch news before updating pkgs? " newsconf

    if [[ $newsconf == "y" || $newsconf == "yes" ]]; then
        open_news
    fi


    read -p "Update Pacman? " updateconf

    if [[ $updateconf == "y" || $updateconf == "yes" ]]; then
        printf '\n'
        take_snapshots
        printf '\n'
        sudo pacman -Syu 
    fi 
   

    printf "\nOperation complete\n" 
}


take_snapshots()
{
    sudo btrfs subvolume snapshot /home /.snapshots/home-$(date +%m-%d-%y-%I:%M:%S)
    sudo btrfs subvolume snapshot / /.snapshots/root-$(date +%m-%d-%y-%I:%M:%S)
}


open_news()
{        
    xdg-open "https://archlinux.org/"
    xdg-open "https://www.reddit.com/r/archlinux/" 
}


print_pacman_update_time()
{
    pacman_mod_time=$(grep "\[PACMAN\] starting full system upgrade" /var/log/pacman.log | tail -1 | grep -oP '\[\K[^\]]+' | head -1)
    last_upgrade_utime=$(date '+%s' -d "$pacman_mod_time")
    time_diff=$(( $current_utime - $last_upgrade_utime ))
    day_diff=$(( $time_diff / 86400 ))
    hour_diff=$(( ($time_diff - 86400 * $day_diff) / 3600 ))

    printf "Last pkgs update: ${day_diff} days, ${hour_diff} hours ago..."
}


main "$@"
