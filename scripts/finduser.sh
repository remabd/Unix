#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]]; then
        result=$(cut -d ":" -f 1,4 /etc/passwd | grep -w "$1")
    else
        result=$(cut -d ":" -f 1,4 /etc/passwd | grep -w "$1")
    fi
    if [ -z "${result}" ]; then
        echo "Error: user not found"
    else
        echo "${result}" | cut -d ":" -f 2
    fi
fi
