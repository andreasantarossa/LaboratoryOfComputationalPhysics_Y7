#!/bin/bash

mkdir -p groups

n_row=0

tail -n +2 LCP_22-23_students.csv | while IFS= read -r row; do
    n_group=$(( (n_row % 18) + 1 ))
    echo "$row" LCP_22-23_students.csv >> ./groups/group_$((n_group)).csv
    ((n_row++))
done