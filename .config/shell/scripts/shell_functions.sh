#!/bin/bash

# Sources:
#   1. on the usage of the 'test' keyword: https://stackoverflow.com/questions/17689511/what-does-ne-mean-in-bash
#   2. https://unix.stackexchange.com/questions/112159/grep-from-the-end-of-a-file-to-the-beginning
#   3. https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
#   4. https://stackoverflow.com/questions/28878629/bash-script-variable-expansion-within-backtick-grep-regex-string


# Navigation
goto()
{
    test $# -eq 1 && builtin cd $1 && ls -1bAFX || builtin cd $1
}


jmp()
{
    # see sources 2 and 4
    if test $# -ne 0
    then
        local prev=$( tac $HISTFILE | grep -m 1 "^$1[[:space:]]" )
    else
        local prev=$( tac $HISTFILE | head -n1 )
    fi

    # see source 3
    IFS=' ' read -ra cmd <<< "$prev"

    local jump_loc=${cmd[-1]}

    if test jump_loc != '.'
    then
        builtin cd $jump_loc

    else
        printf "Destination is not valid!\n"
    fi
}


n()
{
    local count=$( test $# -eq 0 && echo "1" || echo "$1" )

    while test $count -gt 0
    do
        cd ..
        let "count=count-1"
    done
}


t()
{
    test -d $1 && goto $1 || nvim $1
}




# other
cppath()
{
    local cptxt=$( test $# -ne 0 && echo "$(readlink -f $1)" || echo "$(pwd)" )

    if command -v xsel &> /dev/null
    then
       echo "$cptxt" | xsel -b

    elif command -v xclip &> /dev/null
    then
       echo "$cptxt" | xclip
    fi

    printf "\"$cptxt\" copied to clipboard\n"
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
        echo "\"$1\" is not a valid archive"
    fi
}


open()
{
    if test -f $1
    then
        case $1 in
            *.jpg| *.png| *.gif)                            sxiv -b $1 &            ;;&
            *.pdf)                                          zathura --fork $1 &     ;;&
            *.doc| *.docx| *.odt| *.xls| *.xlsx| *.pptx)    libreoffice $1 &        ;;&
            *.mp4)                                          vlc $1 &                ;;&
            *.ipynb)                                        jupyter notebook $1     ;;&
        esac
    fi
}


run()
{
    if test -f $1
    then
        case $1 in
            *.sh)       sh "$@"        ;;
            *.py)       python "$@"    ;;
        esac
    else
        printf "\n\"$1\" is not a defined file type\n"
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
