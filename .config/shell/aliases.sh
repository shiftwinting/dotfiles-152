#!/bin/bash
# aliases


# vars
CONF="/home/j/.config"
SCRIPTS="/home/j/.config/shell/scripts"

# dirs
alias fonts="cd /usr/share/fonts"
alias org="cd $CONF/nvim/utils/org"
alias plugs="cd $HOME/.local/share/nvim/site/pack/packer/"
alias shs="cd $SCRIPTS"
alias vimrc="cd $CONF/nvim"
alias work="cd $HOME/docs/"

# files - configuration
alias aliases="nvim $CONF/shell/aliases.sh"
alias bashrc="nvim $HOME/.bashrc"
alias dunstrc="nvim $CONF/dunst/dunstrc"
alias ffconf="nvim $HOME/.mozilla/firefox/f3fx7i0t.default-release/chrome/userChrome.css"
alias i3conf="nvim $CONF/i3/config"
alias inputrc="sudo nvim /etc/inputrc"
alias mimeapps="nvim $CONF/mimeapps.list"
alias mirrors="sudo nvim /etc/pacman.d/mirrorlist"
alias picomconf="nvim $CONF/picom.conf"
alias sudoers="sudo EDITOR=nvim visudo"
alias termconf="nvim $CONF/alacritty/alacritty.yml"
alias zathurarc="nvim $CONF/zathura/zathurarc"

# files - other
alias note="nvim $HOME/docs/notes/note.txt"
alias todo="nvim /home/j/docs/personal/TODO/org/refile.org"

# functions
# TODO just use push and pop instead of ..
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias boottime="systemd-analyze && systemd-analyze blame"
alias calc="python $SCRIPTS/calculator.py"
alias ci="clear"
alias clean="detox"
alias fz="fzf --preview --preview-window"
alias ir="ls -1AbFX"
alias mixer="pulsemixer"
alias notebook="jupyter notebook"
alias output="sh $SCRIPTS/config_screen.sh"
alias rm="sudo rm -rv"
alias reload=". $HOME/.bashrc"
alias valgrind="valgrind --leak-check=full --show-leak-kinds=all -s --track-origins=yes"

# git
alias add="git add"
alias branches="git branch -vv"
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
alias clone="git clone"
alias commit="git commit"
alias push="git push"
alias rebase="git rebase -i HEAD~2"
alias unstage="git restore --staged"

# package management
alias lsfonts="fc-list : family style"
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

# theme
alias theme="sh $SCRIPTS/change_theme.sh"

# DOOM
alias doom="$HOME/DOOM/zdl &"
