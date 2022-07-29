#!/usr/bin/bash

archive(){
    echo ".............Start archiving $1............."
    tar -czvf $(basename "$1").tar.gz "$1"
    echo ".............Done archiving $1............."
}

echo "==================== ARCHIVING: $@ ===================="

for item in "$@"
do
    archive "$item" &
done

wait
echo "==================== ARCHIVING COMPLETED! ===================="