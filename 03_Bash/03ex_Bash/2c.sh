#!/bin/bash

threshold=$(echo "scale=6; 100 * sqrt(3) / 2" | bc)

count_greater=0
count_smaller=0

while read -r row; do
    set -- $row 
    X=$1
    Y=$2
    Z=$3
    
    d=$(echo "scale=6; sqrt($X^2 + $Y^2 + $Z^2)" | bc )
    
    if (( $(echo "$d < $threshold" | bc -l) )); then
        ((count_smaller++ ))
    else 
        (( count_greater++ ))
    fi
done<data.txt 

echo "Numbers greater than treshold: $count_greater"
echo "Numbers smaller than treshold: $count_smaller"