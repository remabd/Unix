#!/usr/bin/bash
if [ $# != 0 ]; then
    echo "test-fichier.sh: expected 0 argument; got" "$#"
else
    cut -d ":" -f 1,3,4 /etc/passwd | grep "1[0-9]\{2,\}"
fi
