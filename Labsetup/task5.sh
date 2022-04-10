#!/bin/bash
cd Files
rm Task5 -rf
mkdir Task5
cd Task5

printf -- '0123456789%.0s' {1..100} >> f1000b.txt
file="f1000b"

K=00112233445566778889aabbccddeeff
iv=0102030405060708
offset=0x55
declare -a tCiphers=("-aes-128-cbc") # "-bf-cbc" "-aes-128-cfb" "-aes-128-ctr")
declare -a tCorr=("edit")

for type in ${tCiphers[@]}; do
    echo ${type}
    openssl enc $type -e -in "${file}.txt" -out "cipher${type}-${file}.bin" -K $K -iv $iv
    for typeCorr in ${tCorr[@]}; do
        echo ${typeCorr}
        cp "cipher${type}-${file}.bin" "cipher${type}-${file}-${typeCorr}.bin"
        printf '\x00' | dd of="cipher${type}-${file}-${typeCorr}.bin" conv=notrunc bs=1 seek=$(($offset))
        openssl enc $type -d -in "cipher${type}-${file}-${typeCorr}.bin" -out "plain${type}-${file}-${typeCorr}.txt" -K $K -iv $iv
        if test $(diff "$file.txt" "plain${type}-${file}-${typeCorr}.txt" | wc -m) -gt 0 
        then
            echo "Have different at $type"
        fi
    done
done