#!/bin/sh

# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

# Notes:
# on the usage of the 'test' keyword
    # https://stackoverflow.com/questions/17689511/what-does-ne-mean-in-bash
    # ----------------------------------------------------------------------
    # In bash, [ ] is not syntax but an argument. '[' is the opening argument, meaning 
    # 'test if this is true'. The keyword 'test' performs the same function, but doesn't
    # require a closing argument, e.g. ']'



# list directory contents on every cd
cd() 
{ 
    # if there are positional arguments
    if test $# -ne 0 
    then
        # display contents of directory
        builtin cd "$@" 
        ls -1bAFX
    else
        # just go there
        builtin cd
    fi
}


compress()
{
    file=$1
    
    printf "1) tar.gz\n"
    printf "2) zip\n"
    printf "\n"
    read -p ": " compressType
    printf "\n"
    
    read -p "Output name: " filename
    
    if [[ $compressType == "1" ]]; then
        tar -czvf $filename.tar.gz $file

    elif test $compressType == "2"
    then
        zip $filename $file
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
    if [ -f $1 ] ; then
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


log()
{
    month_dir=~/git/personal/journal/$(date +%Y)/$(date +%B)
    entry=$month_dir/$(date +%m_%d).txt


    if test ! -d $month_dir
    then
        mkdir $month_dir
    fi

    nvim $entry
}


open()
{
    file="$1"

    if [ -f $1 ] ; then
        if [[ $* == *\.jpg || $* == *\.png || $* == *\.gif ]]; then
            sxiv -b $file &
    
        elif [[ $* == *\.pdf ]]; then
            zathura --fork $file
    
        elif [[ $* == *\.doc || $* == *\.docx || $* == *\.odt ]]; then
            libreoffice $file &
    
        elif [[ $* == *\.xls || $* == *\.xlsx || $* == *\.csv ]]; then
            libreoffice $file &
    
        elif [[ $* == *\.avi || $* == *\.mkv || $* == *\.mp4 ]]; then
            vlc $file &
    
        else
            printf "This filetype is not yet defined\n"
    
        fi
    fi 
}


t()
{
    arg=$1

    if test -d $arg
    then
        cd $arg

    elif test -f $arg
    then
        nvim $arg

    else
        nvim $arg
    fi
}


rem()
{
    if [ -w /path/to/file ]; then
        rm -rv "$@"
    else
        sudo rm -rv "$@"
    fi
}

week()
{
    today=$(date +%A)

    printf "    =============================\n"
    sed -n "/$today/,/week/{p;/week/q}" ~/docs/TODO.txt
}



