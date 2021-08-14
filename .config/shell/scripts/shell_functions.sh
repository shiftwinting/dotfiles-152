#!/bin/sh

# Sources:
#   on the usage of the 'test' keyword: https://stackoverflow.com/questions/17689511/what-does-ne-mean-in-bash


cd() 
{ 
    test $# -ne 0 && builtin cd $1 && ls -1bAFX || builtin cd $1 
}


compress()
{
    printf "1) tar.gz\n"
    printf "2) zip\n"
    printf "\n"
    read -p ": " compressType
    printf "\n"
    
    read -p "Output name: " filename
    
    if [[ $compressType == "1" ]]; then
        tar -czvf $filename.tar.gz $1

    elif test $compressType == "2"
    then
        zip $filename $1
    fi 
}

# copy working dir to clipboard
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
            *)           echo "'$1' is not a defined extractable type" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi 
} 


open()
{
    if test -f $1
    then
        case $1 in
            *.jpg|*.png|*.gif)                  sxiv -b $1           ;;&
            *.pdf)                              zathura --fork $1    ;;& 
            *.doc|*.docx|*.odt|*.xls|*.xlsx)    libreoffice $1       ;;& 
        esac
    fi
}


t()
{
    test -d $1 && cd $1 || nvim $1
}
