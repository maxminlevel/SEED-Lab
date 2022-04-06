#!/bin/bash
set e
cd Files
mkdir Task4
cd Task4

printf -- '01234%.0s' >> f5b.txt
printf -- '0123456789%.0s' >> f10b.txt
printf -- '0123456789012345%.0s' >> f16b.txt
printf -- '0123456789%.0s' {1..100} >> f1000b.txt

K=00112233445566778889aabbccddeeff
iv=0102030405060708

declare -a files=("f5b.txt" "f10b.txt" "f16b.txt" "f1000b.txt" )
declare -a tCiphers=("-aes-128-cbc" "-bf-cbc" "-aes-128-cfb" "-aes-128-ctr")
for type in ${tCiphers[@]}; do
    echo ${type}
    for file in ${files[@]}; do
        echo ${file}
        openssl enc $type -e -in ${file} -out cipher${type}-${file}.bin -K $K -iv $iv
        openssl enc $type -d -in cipher${type}-${file}.bin -out plain${type}-${file}.txt -K $K -iv $iv
        if test $(diff plaintext.txt plain${type}.txt | wc -m) -gt 0 
        then
            echo "Have different at $type"
        fi
    done
done