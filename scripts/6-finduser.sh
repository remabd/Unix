#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    # On découpe le fichier /etc/passwd pour ne garder que les colonnes qui nous intéressent
    # On grep le résultat avec l'argument du script
    result=$(cut -d ":" -f 1,4 /etc/passwd | grep -w "$1")
    # Si le résultat est vide
    if [ -z "$result" ]; then
        # On affiche une erreur
        echo "Error: user not found"
    else
        # Sinon, on donne l'ui de l'utilisateur
        echo "$result" | cut -d ":" -f 2
    fi
fi
