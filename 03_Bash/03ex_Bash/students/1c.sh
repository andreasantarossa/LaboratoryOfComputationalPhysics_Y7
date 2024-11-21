#!/bin/bash

for letter in {A..Z};
    do count=$(tail -n +2 LCP_22-23_students.csv | grep -i "^$letter" | wc -l); 
    echo "$letter: $count"; 
done