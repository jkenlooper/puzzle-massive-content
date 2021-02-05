#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset

LIST=$1
GROUP=$2

while read line
do
    char=$(echo $line | cut -d ' ' -f1)
    name=$(echo $line | cut -d ' ' -f2-)
    ./text-icon.sh "$char" "$name" "$GROUP"

done < $LIST
