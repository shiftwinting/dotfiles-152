# see https://zdoom.org/wiki/Compile_GZDoom_on_Linux


GZDOOM_DIR="/home/j/gzdoom_build" 


main()
{
    if test -d $GZDOOM_DIR
    then
        sudo rm -r $GZDOOM_DIR
    fi

    mkdir $GZDOOM_DIR
    cd $GZDOOM_DIR

    printf "\n"
    git clone git://github.com/coelckers/gzdoom.git
    mkdir -pv gzdoom/build

    printf "\n"
    cd gzdoom
    git config --local --add remote.origin.fetch +refs/tags/*:refs/tags/*
    git pull

    # compile
    a='' && [ "$(uname -m)" = x86_64 ] && a=64
    c="$(lscpu -p | grep -v '#' | sort -u -t , -k 2,4 | wc -l)" ; [ "$c" -eq 0 ] && c=1
    cd ~/gzdoom_build/gzdoom/build &&
    rm -f output_sdl/liboutput_sdl.so &&
    if [ -d ../fmodapi44464linux ]; then
    f="-DFMOD_LIBRARY=../fmodapi44464linux/api/lib/libfmodex${a}-4.44.64.so \
    -DFMOD_INCLUDE_DIR=../fmodapi44464linux/api/inc"; else
    f='-UFMOD_LIBRARY -UFMOD_INCLUDE_DIR'; fi &&
    cmake .. -DCMAKE_BUILD_TYPE=Release $f &&
    make -j$c

    printf "\nOperation complete\n" 
} 


main "$@"
