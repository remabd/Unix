#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    if [ -e "$1" ]; then
        RESULT=""

        if [ -d "$1" ]; then
            echo "$1" " est un répertoire"
        elif [ -f "$1" ]; then
            if [ -S "$1" ]; then
                echo "$1" " est un fichier ordinaire vide"
            else
                echo "$1" " est un fichier ordinaire non vide"
            fi
        fi;

        if [ -r "$1" ]; then
            RESULT+=" lectrue"
        fi

        if [ -w "$1" ]; then
            RESULT+=" écriture"
        fi

        if [ -x "$1" ]; then
            RESULT+=" éxécution"
        fi

        UTILISATEUR=$(whoami)

        if [ "$RESULT" = "" ]; then
            echo "$1 n'est pas accessible par ${UTILISATEUR}"
        else
            echo "$1 est accessible par ${UTILISATEUR} en${RESULT}"
        fi

    else
        echo "File not found"
        return 0;
    fi
fi
