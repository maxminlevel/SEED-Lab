#!/bin/bash
set -e
cd Files
rm Task4 -rf
mkdir Task4
cd Task4

printf -- '01234%.0s' >> f5b.txt
printf -- '0123456789%.0s' >> f10b.txt
printf -- '0123456789012345%.0s' >> f16b.txt

K=00112233445566778889aabbccddeeff
iv=0102030405060708

declare -a files=("f5b" "f10b" "f16b")
declare -a tCiphers=("-aes-128-cbc" "-aes-128-ecb" "-aes-128-cfb" "-aes-128-ctr")
for type in ${tCiphers[@]}; do
    echo ${type}
    for file in ${files[@]}; do
        echo ${file}
        openssl enc $type -e -in "${file}.txt" -out "cipher${type}-${file}.bin" -K $K -iv $iv
        openssl enc $type -d -in "cipher${type}-${file}.bin" -out "plain${type}-${file}.txt" -K $K -iv $iv -nopad
        if [test $(diff "${file}.txt" "plain${type}-${file}.txt" | wc -m) -gt 0]; then
            echo "Have different at $type"
        else
            hexdump -C "${file}.txt"
            hexdump -C "plain${type}-${file}.txt"
        fi
    done
done