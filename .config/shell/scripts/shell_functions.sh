#!/bin/bash


cppath()
{
    # copy just filename with -f
    if test "$1" == "-f"; then
        local cptxt=$2

    # copy full path to a file if no flags, but one arg
    elif test $# -ne 0; then
        local cptxt=$(readlink -f $1)

    # copy pwd if no args at all
    else
        local cptxt=$(pwd)
    fi

    # check for existence of clipboard tool
    if type xsel &> /dev/null; then

        # copy to clipboard
        echo "$cptxt" | xsel -b

        printf "\n    \"$cptxt\"\n    has been copied!\n"

    else
        printf "Copy not performed!\nPlease install a clipboard utility!\n"
    fi
}




extract()
{
    if test -f $1
    then
        case $1 in
            *.7z)        7z x $1        ;;
            *.bz2)       bunzip2 $1     ;;
            *.deb)       ar x $1        ;;
            *.gz)        gunzip $1      ;;
            *.rar)       unrar x $1     ;;
            *.tar)       tar xf $1      ;;
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.tar.xz)    tar xf $1      ;;
            *.tar.zst)   unzstd $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *)           echo "\"$1\" is not a valid archive" ;;
        esac
    else
        echo "\"$1\" is a directory, not a valid archive"
    fi
}




# draws jump locations from commands in
# history. If a relative path without
# a tilde is used and you are outside of
# the rood dir that you conducted the mv
# from, the location cannot be found
jmp()
{
    # TODO
    #   - teach to handle flags for cp?
    #   - export as an engine for finding the last
    #     relevant command in history.
    #       - cppath could use this to copy the path
    #         of the last move
    if test $# -ne 0
    then
        # gets the first item from history that matches arg
        local prev=$( tac $HISTFILE | grep -m 1 "^$1[[:space:]]" )
    else
        # gets the last used mv or cp command
        local prev=$( tac $HISTFILE\
            | grep -m 1 "^mv[[:space:]]\|cp[[:space:]]" )
    fi

    # get location to jump to
    local rel_path=$(cut -d ' ' -f 3 <<< $prev)

    # expand tildes in path
    local full_path="${rel_path/#\~/$HOME}"

    builtin cd $full_path && ls -1bAFX
}




open()
{
    if test -f $1
    then
        case $1 in
            *.jpg| *.png| *.gif)                            imv $1 &                ;;&
            *.pdf)                                          zathura --fork $1 &     ;;&
            *.doc| *.docx| *.odt| *.xls| *.xlsx| *.pptx)    libreoffice $1 &        ;;&
            *.mp4)                                          vlc $1 &                ;;&
            *.ipynb)                                        jupyter notebook $1     ;;&
        esac
    fi
}




seal()
{
    printf "\n"
    printf "1) tar.gz\n"
    printf "2) zip\n"
    printf "\n"

    read -p "Compression type: " compressType
    read -p "Output name     : " filename


    case $compressType in
        "1")    tar -czvf $filename.tar.gz "$@"   ;;
        "2")    zip -r -z $filename "$@" ;;
    esac
}




t()
{
    test -d $1 && builtin cd $1 && ls -1bAFX || nvim $1
}
