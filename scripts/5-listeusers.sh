#!/usr/bin/bash
if [ $# != 0 ]; then
    echo "test-fichier.sh: expected 0 argument; got" "$#"
else
    echo "###### Using cut"
    # Le fichier /etc/passwd contient plusieurs infos sur les utilisateurs
    # cut nous permet de découper le fichier en grille et de ne garder que les colonnes qui nous intéressent
    # ici on sépare le fichier avec -d ":"
    # On garde les colonnes 1,3 et 4
    # Grep avec le regex nous permet de tester un nombre superieur à 1000
    cut -d ":" -f 1,3,4 /etc/passwd | grep "1[0-9]\{2,\}"
    echo "###### Using awk"
    # On peut faire sensiblement la même chose avec awk
    awk '{print $1 $3 $4}' FS=":" OFS=";" /etc/passwd | grep "1[0-9]\{2,\}"
fi
