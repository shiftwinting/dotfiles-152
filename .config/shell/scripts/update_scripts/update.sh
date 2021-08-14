#!/bin/sh
    
# Notes:
#   - original @ https://gist.github.com/yangl1996/44349cd3317be844e7dcfc60c0a05863
#   - won't handle situations where /var/log/pacman.log doesn't exist or full system upgrade not run once


main()
{
    if test $# -ne 0
    then
        sudo pacman -S "$@"
    else
        current_utime=$(date '+%s') 

        newline
        print_pacman_update_time

        newline
        print_nvim_update_time

        newline
        newline

        exe_menus 
    fi
}


exe_menus()
{
    read -p "    Check Arch news before updating Pacman? " newsconf
    newline

    if [[ $newsconf == "y" || $newsconf == "yes" ]]; then
        open_news
    fi

    read -p "    Update Pacman? " updateconf
    read -p "    Update Neovim? " nvimchoice
    read -p "    Update Packer? " packerchoice
    newline 
    

    if [[ $updateconf == "y" || $updateconf == "yes" ]]; then
        exe_pacman_update
        newline 
    fi 


    if [[ $nvimchoice == "y" || $nvimchoice == "yes" ]]
    then
        exe_nvim_update
    fi

    
    if [[ $packerchoice == "y" || $packerchoice == "yes" ]]
    then
        exe_packer_update
    fi 


    printf "Operation complete\n" 
}


exe_pacman_update()
{
    sudo btrfs subvolume snapshot /home /.snapshots/home-$(date +%m-%d-%y-%I:%M:%S)
    sudo btrfs subvolume snapshot / /.snapshots/root-$(date +%m-%d-%y-%I:%M:%S)
    sudo pacman -Syu 
}


exe_nvim_update()
{
    if test -d "/home/j/neovim" 
    then
        newline
        sudo rm -rv /home/j/neovim
        newline
    fi

    git clone https://github.com/neovim/neovim.git /home/j/neovim
    cd /home/j/neovim 
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd 
}


exe_packer_update()
{
    if test -d "/home/j/.local/share/nvim/site/pack/packer/start/packer.nvim" 
    then
        sudo rm -rv /home/j/.local/share/nvim/site/pack/packer/start/packer.nvim
    fi 

    git clone https://github.com/wbthomason/packer.nvim /home/j/.local/share/nvim/site/pack/packer/start/packer.nvim
}


newline()
{
    printf "\n"
}


open_news()
{        
    xdg-open "https://archlinux.org/"
    xdg-open "https://www.reddit.com/r/archlinux/" 
}


print_nvim_update_time()
{
    # source
    # https://stackoverflow.com/questions/552724/how-do-i-check-in-bash-whether-a-file-was-created-more-than-x-time-ago

    nvim_mod_time=$( date -r /usr/local/bin/nvim '+%s' )
    nvim_age=$(( $current_utime - $nvim_mod_time ))
    day_diff=$(( $nvim_age / 86400 ))
    hour_diff=$(( ($nvim_age - 86400 * $day_diff) / 3600 )) 

    printf "Neovim upgraded ${day_diff} days, ${hour_diff} hours ago."
}


print_pacman_update_time()
{
    pacman_mod_time=$(grep "\[PACMAN\] starting full system upgrade" /var/log/pacman.log | tail -1 | grep -oP '\[\K[^\]]+' | head -1)
    last_upgrade_utime=$(date '+%s' -d "$pacman_mod_time")
    time_diff=$(( $current_utime - $last_upgrade_utime ))
    day_diff=$(( $time_diff / 86400 ))
    hour_diff=$(( ($time_diff - 86400 * $day_diff) / 3600 ))

    printf "Pacman upgraded ${day_diff} days, ${hour_diff} hours ago."
}


main "$@"
