#!/bin/sh

# Sources:
#   1. on the usage of the 'test' keyword: https://stackoverflow.com/questions/17689511/what-does-ne-mean-in-bash

cd() 
{ 
    test $# -ne 0 && builtin cd $1 && ls -1bAFX || builtin cd $1 
} 


cppwd()
{
    if command -v xsel &> /dev/null
    then
       pwd | xsel -b

    elif command -v xclip &> /dev/null
    then
        pwd | xclip
    fi

    printf "\"$PWD\" copied to clipboard\n"
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
            *.jpg|*.png|*.gif)                  sxiv -b $1 &            ;;&
            *.pdf)                              zathura --fork $1 &     ;;& 
            *.doc|*.docx|*.odt|*.xls|*.xlsx)    libreoffice $1 &        ;;& 
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
        "2")    zip $filename "$@" ;;
    esac
}


t()
{
    test -d $1 && cd $1 || nvim $1
}
