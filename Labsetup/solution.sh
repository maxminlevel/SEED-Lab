#!/bin/bash
set e
files=("task1.sh")
# files=$(ls *.sh)
echo "$files"
for file in ${files[@]}; do
    echo $file
    bash $file >> task${file:4:1}_output.txt
done