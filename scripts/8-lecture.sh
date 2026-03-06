#!/usr/bin/bash
if [ $# != 1 ]; then
    echo "test-fichier.sh: expected 1 argument; got" "$#"
else
    for filename in $1*; do
        if [ ! -d "$filename" ]; then
            ISREADABLE=$(file "$filename" | grep text)
            if [ -n "$ISREADABLE" ]; then
                echo -n "Voulez vous lire $filename ? "
                read response
                if [[ "$response" = "yes" || "$response" = "y" || "$response" = "Y" ]]; then
                    more "$filename"
                fi
            fi
        fi
    done
fi
