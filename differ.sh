#!/usr/bin/env bash

files=$(find . -type f | sed 's/\.\/\(.*\)/\1/' | grep -E '^\.' | grep -v -E '\.git|differ')

for file in $files; do
    diff "$file" "/home/fredrik/$file"
    if [ "0" -ne "$?" ]; then
        echo "#### $file differs ####"
    fi
done
