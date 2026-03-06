#!/usr/bin/bash
# Si le nombre d'arg est différent de deux
if [ $# != 2 ]; then
    # On affiche une erreur
    echo "test-fichier.sh: expected 2 argument; got" "$#"
else
    # Si non on ajoute les deux arguments
    echo CONCAT = "$1" "$2"
fi
