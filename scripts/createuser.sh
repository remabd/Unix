#!/usr/bin/bash
if [ $# != 0 ]; then
    echo "test-fichier.sh: expected 0 argument; got" "$#"
else
    if ! [[ $USER = "root" ]] ;then
        echo "Error: permission denied";exit 1
    fi
    echo "login"
    read login
    test=$(./finduser.sh "${login}")
    if ! [[ "${test}" = "Error: user not found" ]] ;then
        echo "Error: user used";exit 1
    fi
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




    # re='^[0-9]+$'
    # if ! [[ $1 =~ $re ]]; then
    #     result=$(cut -d ":" -f 1,4 /etc/passwd | grep -w "$1")
    # else
    #     result=$(cut -d ":" -f 1,4 /etc/passwd | grep -w "$1")
    # fi
    # if [ -z "${result}" ]; then
    #     echo "Error: user not found"
    # else
    #     echo "${result}" | cut -d ":" -f 2
    # fi
fi
