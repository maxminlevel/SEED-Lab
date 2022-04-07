#!/bin/bash
set e
bash task1.sh >> /dev/null
cd Files
rm Task61 -rf
mkdir Task61
cp plaintext.txt Task61/plaintext.txt
cd Task61

K=00112233445566778889aabbccddeeff
iv=0102030405060708

declare -a tCiphers=("-aes-128-cbc" "-bf-cbc" "-aes-128-cfb" "-aes-128-ctr")
for type in ${tCiphers[@]}; do
    echo -e "\n"$type
    openssl enc $type -e -in plaintext.txt -out cipher${type}.bin -K $K -iv $iv
    openssl enc $type -d -in cipher${type}.bin -out plain${type}.txt -K $K -iv $iv
    if test $(diff plaintext.txt plain${type}.txt | wc -m) -gt 0 
    then
        echo "Have different at $type"
    else
        echo "Have no different"
    fi
done