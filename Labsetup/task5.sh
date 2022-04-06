#!/bin/bash
cd Files

printf -- '0123456789%.0s' {1..100} >> f1000b.txt
file= "f1000b.txt"

K=00112233445566778889aabbccddeeff
iv=0102030405060708
declare -a tCiphers=("-aes-128-cbc" "-bf-cbc" "-aes-128-cfb" "-aes-128-ctr")
declare -a tCorr=("delete" "edit")

for typeCorr in ${tCorr[@]}; do
    echo "Create ${typeCorr} corrupted file"
    # // use dd here
done

for type in ${tCiphers[@]}; do
    echo ${type}
    openssl enc $type -e -in ${file} -out cipher${type}-${file}.bin -K $K -iv $iv
    for typeCorr in ${tCorr[@]}; do
        echo ${typeCorr}
        openssl enc $type -d -in cipher${type}-${file}-${typeCorr}.bin -out plain${type}-${file}-${typeCorr}.txt -K $K -iv $iv
        if test $(diff plaintext.txt plain${type}.txt | wc -m) -gt 0 
        then
            echo "Have different at $type"
        fi
    done
done