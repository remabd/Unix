#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    if [ -d $1 ]; then
        RESULTD=()
        RESULTF=()
        for filename in $1*; do
            if [ -d ${filename} ]; then
                RESULTD+=("${filename}")
            else
                RESULTF+=("${filename}")
            fi
        done

        echo "###### Fichiers dans $1"
        for f in "${RESULTF[@]}"; do
            echo "${f}"
        done
        echo "###### Répertoires dans $1"
        for f in "${RESULTD[@]}"; do
            echo "${f}"
        done
    else
        echo "test-fichier.sh: $1 is not a directory"
    fi
fi
