#!/bin/bash

# vars
CONF="$HOME/.config"
SCRIPTS="$CONF/shell/scripts"


# temp aliases
alias 450="t $HOME/files/school/coursework/class_files/cs/450-parallel_programming/"

# dirs
alias class="t $HOME/files/school/coursework/class_files"
alias ffconf="t $HOME/.mozilla/firefox"
alias plugs="t $HOME/.local/share/nvim/site/pack/packer/"
alias shs="t $SCRIPTS"
alias vimrc="t $CONF/nvim/lua"
alias work="t $HOME/files/"

# files - configuration
alias aliases="nvim $CONF/shell/aliases/aliases.sh"
alias bashrc="nvim $HOME/.bashrc"
alias dunstrc="nvim $CONF/dunst/dunstrc"
alias gitconf="t $HOME/.gitconfig"
alias i3conf="nvim $CONF/i3/config"
alias inputrc="sudo nvim /etc/inputrc"
alias mimeapps="nvim $CONF/mimeapps.list"
alias mirrors="sudo nvim /etc/pacman.d/mirrorlist"
alias picomconf="nvim $CONF/picom.conf"
alias sudoers="sudo EDITOR=nvim visudo"
alias termconf="nvim $CONF/alacritty/alacritty.yml"
alias xinitrc="nvim ~/.xinitrc"
alias zathurarc="nvim $CONF/zathura/zathurarc"

# files - other
alias todo="nvim $HOME/files/administrative/note.txt"

# functions
# TODO just use push and pop instead of ..
alias ..="t .."
alias boottime="systemd-analyze && systemd-analyze blame"
alias calc="python $SCRIPTS/calculator.py"
alias ci="clear"
alias clean="detox"
alias fz="fzf --preview --preview-window"
alias ir="ls -1AbFX"
alias mixer="pulsemixer"
alias notebook="jupyter notebook"
alias rm="sudo rm -rv"
alias reload=". $HOME/.bashrc"
alias sync_clock="timedatectl set-ntp true"

# git
alias cfg="/usr/bin/git --git-dir=$HOME/cfg.git/ --work-tree=$HOME"
alias g="git"
alias trunk='t $(git rev-parse --show-toplevel)'


# package management
alias install="sudo pacman -S"
alias lspacs="pacman -Qe"
alias mkpkg="makepkg -cri"
alias paclog="cat /var/log/pacman.log | grep 'install\|remove'"
alias pacs="pacman -Q | wc -l"
alias uninstall="sudo pacman -Rsn"
alias update="sh $SCRIPTS/update_pkgs.sh"

# power options
alias reboot="sudo systemctl reboot"
alias shutdown="sudo systemctl poweroff"
alias uefi="sudo systemctl reboot --firmware-setup"

# services
alias disable="sudo systemctl disable"
alias enable="sudo systemctl enable"
alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias stop="sudo systemctl stop"

# snapshots
alias snaphome="sudo btrfs subvolume snapshot /home /.snapshots/home-$(date +%m-%d-%y-%I:%M:%S%p)"
alias snaproot="sudo btrfs subvolume snapshot / /.snapshots/root-$(date +%m-%d-%y-%I:%M:%S%p)"

# DOOM
alias doom="$HOME/DOOM/zdl &"
