#!/usr/bin/bash
if [ $# != 0 ]; then
    echo "test-fichier.sh: expected 0 argument; got" "$#"
else
    # Si l'utilisateur n'est pas root
    if ! [[ $USER = "root" ]]; then
        # On affiche une erreur
        echo "Error: permission denied"
        exit 1
    fi
    # On demande une info
    echo -n "login"
    # On lit la réponse et on l'ayffecte à une variable
    read login

    # On lance le script pour vérifier si un utilisateur existe pour ce login
    test=$(./6-finduser.sh "$login")
    # Si oui
    if ! [[ "$test" = "Error: user not found" ]]; then
        # On affiche une erreur
        echo "Error: user used"
        # On met fin au script
        exit 1
    fi
    # Sinon

    echo -n "Nom"
    read name
    echo -n "Prenom"
    read firstname
    echo -n "UID"
    read uid
    echo -n "GID"
    read gid
    echo -n "Commentaires"
    read comments
    echo -n "Password"
    read password

    # On crée l'utilisateur
    useradd -NM -p "$password" -g "$gid" -u "$uid" -c "$comments" "$login"
    passwd
    # On vérifie que le home est disponible
    if [ ! -d "home/$login" ]; then
        # On crée un répertoire pour le nouvel utilisateur
        mkdir "/home/$login"
        # On lui donne la propriété du dossier
        chown "$login:$gid" "home/$login"
        # On lui donne les bons droits: ecriture lecture execution pour l'utilisateur seulement
        chmod 700 "home/$login"
    fi
fi
