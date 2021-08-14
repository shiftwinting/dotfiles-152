#!/bin/bash

main()
{
    if test $# -eq 0
    then
        git add .

    else
        git add $@

    fi

    git commit
    git push
}


main "$@"

