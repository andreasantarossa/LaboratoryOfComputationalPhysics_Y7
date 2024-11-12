#!/bin/bash

n=$1

mkdir -p copies

for (( i=1; i<=$n; i++ ));do

    output_file="./copies/copy_$i.txt"

    while read -r row; do
        for x in $row; do
            result=$(echo "scale=6; $x / $i" | bc)
            echo -n "$result " >> "$output_file"
        done
        echo "" >> "$output_file"
    done<data.txt 
    
done