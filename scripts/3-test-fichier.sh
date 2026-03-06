#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    # Si le fichier existe
    if [ -e "$1" ]; then
        # On crée une variable pour stocker le résultat
        RESULT=""

        # Si c'est un dossier
        if [ -d "$1" ]; then
            # On affiche
            echo "$1" " est un répertoire"
        # Si c'est un fichier
        elif [ -f "$1" ]; then
            # S'il est vide
            if [ -S "$1" ]; then
                # On affiche
                echo "$1" " est un fichier ordinaire vide"
            else
                # Sinon, on affiche autre chose
                echo "$1" " est un fichier ordinaire non vide"
            fi
        fi

        # Si l'utilisateur a les droits de lecture
        if [ -r "$1" ]; then
            # On ajoute lecture a RESULT
            RESULT+=" lecture"
        fi

        # Si l'utilisateur a les droits d'écriture
        if [ -w "$1" ]; then
            # On ajoute
            RESULT+=" écriture"
        fi

        # Si l'utilisateur a les droits d'execution
        if [ -x "$1" ]; then
            # On ajoute
            RESULT+=" éxécution"
        fi

        # On affecte a UTILISATEUR le résultat de la commande whoami
        # whoami donne l' utilisateur courant
        UTILISATEUR=$(whoami)

        # Si RESULT est vide
        if [ "$RESULT" = "" ]; then
            # On affiche
            echo "$1 n'est pas accessible par ${UTILISATEUR}"
        else
            # Sinon, on affiche
            echo "$1 est accessible par ${UTILISATEUR} en${RESULT}"
        fi

    else
        #Sinon on affiche une erreur
        echo "File not found"
        return 0
    fi
fi
