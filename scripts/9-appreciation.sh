#!/usr/bin/bash
if [ $# != 0 ]; then
    echo "test-fichier.sh: expected 0 argument; got" "$#"
else
    # On lit la note
    echo -n "note: "
    read note

    # On switch sur les résultats possibles
    if [ "$note" -ge 21 ]; then
        echo "mytho"
    elif [ "$note" -ge 16 ]; then
        echo "très bien"
    elif [ "$note" -ge 14 ]; then
        echo "bien"
    elif [ "$note" -ge 12 ]; then
        echo "assez bien"
    elif [ "$note" -ge 10 ]; then
        echo "moyen"
    elif [ "$note" -ge 0 ]; then
        echo "insuffisant"
    else
        echo "mytho"
    fi
fi
