#!/usr/bin/env bash

files=$(find . -type f | sed 's/\.\/\(.*\)/\1/' | grep -E '^\.' | grep -v -E '\.git|differ')
exit_status=0

for file in $files; do
    diff "$file" "$HOME/$file"
    if [ "0" -ne "$?" ]; then
        exit_status=1
        echo "#### $file differs ####"
    fi
done

exit $exit_status
