#!/usr/bin/bash
if [ $# != 2 ]; then
    echo "test-fichier.sh: expected 2 argument; got" "$#";
else
    echo CONCAT = "$1" "$2";
fi
