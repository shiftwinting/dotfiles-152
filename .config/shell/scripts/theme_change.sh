
#!/bin/sh

# TODO: 
#   change logic for nvim theme


main()
{
    # prompt
    printf "\nWhat theme type would you like to use?"

    printf "\n   1) Solar Light\n   2) Dark\n\n"
    read -p "   " typeChoice


    if [[ $typeChoice -eq 1 ]]; then
        desertTheme 

    elif [[ $typeChoice -eq 2 ]]; then 
        dissonanceTheme  
    fi
}


desertTheme()
{  
    # scheme
    desertScheme="vim.g.colors_name = \"desert\""

    # foreground
    desertFG="#000000"

        # light Desert background
        lightDesertBG="#DDD6B5"

        # darker Desert background
        darkerDesertBG="#CDC392"

        # darkest Desert background
        darkestDesertBG="#BDB06F"   


    printf "\n   --Desert--\n"
    printf "   1) Light Desert\n   2) Darker Desert\n   3) Darkest Desert\n\n"
    read -p "   " themeChoice

    case $themeChoice in

        1)
            changeTheme "$desertScheme" "$lightDesertBG" "$desertFG"
            ;;

        2)
            changeTheme "$desertScheme" "$darkerDesertBG" "$desertFG"
            ;;

        3)
            changeTheme "$desertScheme" "$darkestDesertBG" "$desertFG"  
            ;;
    esac
}


dissonanceTheme()
{
    # dissonance
    dissonanceScheme="vim.g.colors_name = \"dissonance\""
    dissonanceFG="#FBFAF5" 

        # light dissonance
        lightDissonanceBG="#6F7E94"
        lightDissonanceFG="#000000"

        # dark dissonance   
        darkDissonanceBG="#38404B" 

        # darker dissonance
        darkerDissonanceBG="#2C2F33"

        # darkest dissonance
        darkestDissonanceBG="#000000"


    printf "\n   --Dissonance--\n"
    printf "   1) light Dissonance\n   2) dark Dissonance\n   3) darker dissonance\n   4) darkest dissonance\n\n"
    read -p "   " themeChoice


    case $themeChoice in
        1)
            changeTheme "$dissonanceScheme" "$lightDissonanceBG" "$lightDissonanceFG"
            ;;

        2)
            changeTheme "$dissonanceScheme" "$darkDissonanceBG" "$dissonanceFG"
            ;;

        3)
            changeTheme "$dissonanceScheme" "$darkerDissonanceBG" "$dissonanceFG" 
            ;;

        4)
            changeTheme "$dissonanceScheme" "$darkestDissonanceBG" "$dissonanceFG"   
            ;;
    esac
}


changeTheme()
{      
    # variables
    nvimScheme=$1

    startpage="    background-color: $2;"

    sxivBG="Sxiv.background:$2"

    termBG="background: \'$2\' #bgColorFlag"
    termFG="foreground: \'$3\' #fgColorFlag"


    # execute changes
    # nvim
    # sed -i "/colors_name/s/.*/$nvimScheme/g" ~/.config/nvim/lua/theme.lua

    # startpage
    sed -i "/background/s/.*/$startpage/g" ~/docs/startpage/startpage.css

    # terminal
    sed -i "/bgColorFlag/s/.*/    $termBG/g" ~/.config/alacritty/alacritty.yml
    sed -i "/fgColorFlag/s/.*/    $termFG/g" ~/.config/alacritty/alacritty.yml

    # sxiv                                                       
    sed -i "/Sxiv.background/s/.*/$sxivBG/g" ~/.Xresources  
    xrdb ~/.Xresources                                            
}


# run main
main "$@"

