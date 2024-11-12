#!/bin/bash

count_even=0

while read -r row; do
    for n in $row; do
        if (( n % 2 == 0 )); then
            ((count_even++))
        fi
    done
done<data.txt 

echo "Even numbers: $count_even"