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
    echo "login"
    # On lit la réponse et on l'ayffecte à une variable
    read login

    # On lance le script pour vérifier si un utilisateur existe pour ce login
    test=$(./6-finduser.sh "${login}")
    # Si oui
    if ! [[ "${test}" = "Error: user not found" ]]; then
        # On affiche une erreur
        echo "Error: user used"
        # On met fin au script
        exit 1
    fi
    # Sinon

    echo "Nom"
    read name
    echo "Prenom"
    read firstname
    echo "UID"
    read uid
    echo "GID"
    read gid
    echo "Commentaires"
    read comments
    echo "Password"
    read password
    # echo "Confirm password"
    # read password2
    #
    # if [ password != password2 ]; then
    #

    # On crée l'utilisateur
    useradd -Nm -p ${password} -g ${gid} -u ${uid} -c ${comments} ${login}
    # On crée un répertoire pour le nouvel utilisateur
    # mkdir /home/${login}
fi
