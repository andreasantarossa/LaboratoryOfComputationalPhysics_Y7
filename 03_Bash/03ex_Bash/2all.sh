#!/bin/bash


k=$1


grep -v "^#" data.csv | sed -e "s/,//g" > data.txt


count_even=0

while read -r row; do
    for n in $row; do
        if (( n % 2 == 0 )); then
            ((count_even++))
        fi
    done
done<data.txt 

echo "Even numbers: $count_even"



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



mkdir -p copies

for (( i=1; i<=$k; i++ ));do

    output_file="./copies/copy_$i.txt"

    while read -r row; do
        for x in $row; do
            result=$(echo "scale=6; $x / $i" | bc)
            echo -n "$result " >> "$output_file"
        done
        echo "" >> "$output_file"
    done<data.txt 
    
done