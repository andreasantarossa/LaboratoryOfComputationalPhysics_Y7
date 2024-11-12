#!/bin/bash

letter_most=""
max_count=0
for letter in {a..z};
    do count=$(grep -oi "$letter" LCP_22-23_students.csv | wc -l);
    if [ $count -gt $max_count ]; then 
        letter_most=$letter;
        max_count=$count
    fi
done
echo "The letter '$letter_most' appears the most times: $max_count"