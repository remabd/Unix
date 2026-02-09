#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    if [ -d $1 ]; then
        RESULTD = ""
        RESULTF = ""
        for i in [ ]

    else
        echo "test-fichier.sh: $1 is not a directory"
    fi
fi
