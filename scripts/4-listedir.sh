#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    # Si l'argument est un dossier
    if [ -d $1 ]; then
        # On crée deu variables pour stocker les résultats
        RESULTD=()
        RESULTF=()
        # On boucle sur les fichiers dans l'argument
        for filename in "$1*"; do
            # Si c'est un dossier
            if [ -d ${filename} ]; then
                # On l'ajoute à la variable de stockage de dossiers
                RESULTD+=("${filename}")
            else
                # Sinon on l'ajoute à l'autre variable
                RESULTF+=("${filename}")
            fi
        done

        # On affiche les fichiers puis les dossiers
        echo "###### Fichiers dans $1"
        for f in "${RESULTF[@]}"; do
            echo "${f}"
        done
        echo "###### Répertoires dans $1"
        for f in "${RESULTD[@]}"; do
            echo "${f}"
        done
    # Sinon
    else
        # On affiche une erreur
        echo "listedir.sh: $1 is not a directory"
    fi
fi
