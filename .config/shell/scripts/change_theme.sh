#!/bin/sh

main()
{
    # foreground
    lightFG="#FDFDFB"

    # background
    lightBG="#6F7E94"
    darkBG="#38404B"
    darkerBG="#2C2F33"
    blackBG="#000000"


    printf "\n1) light\n2) dark\n3) darker\n4) darkest\n\n"
    read -p "    " themeChoice


    case $themeChoice in
        1) changeTheme "$lightBG"  "#000000" ;;
        2) changeTheme "$darkBG"   "$lightFG"  ;;
        3) changeTheme "$darkerBG" "$lightFG"  ;;
        4) changeTheme "$blackBG"  "$lightFG"  ;;
    esac
}


changeTheme()
{
    startpage="    background-color: $1;"

    sxivBG="Sxiv.background:$1"

    termBG="    background: \'$1\' #bgColorFlag"
    termFG="    foreground: \'$2\' #fgColorFlag"


    # startpage
    sed -i "/background/s/.*/$startpage/g" ~/docs/startpage/startpage.css

    # terminal
    sed -i "/bgColorFlag/s/.*/$termBG/g" ~/.config/alacritty/alacritty.yml
    sed -i "/fgColorFlag/s/.*/$termFG/g" ~/.config/alacritty/alacritty.yml

    # sxiv
    sed -i "/Sxiv.background/s/.*/$sxivBG/g" ~/.Xresources
    xrdb ~/.Xresources
}


main "$@"
