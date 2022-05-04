#!/bin/bash
set -e
bash task1.sh >> /dev/null
cd Files
rm Task2 -rf
mkdir Task2
cp plaintext.txt Task2/plaintext.txt
cd Task2

K=00112233445566778889aabbccddeeff
iv=0102030405060708
n=$(openssl list -cipher-algorithms | wc -l)
echo -e "Number ciphertype openssl enc support: $n"
echo -e "Type command 'openssl list -cipher-algorithms' to know\n"

declare -a tCiphers=("-aes-128-cbc" "-aes-128-cfb" "-aes-128-ofb" "-aes-128-ctr" "-aes-128-ecb")
for type in ${tCiphers[@]}; do
    echo $type
    openssl enc $type -e -in plaintext.txt -out cipher${type}.bin -K $K -iv $iv
    openssl enc $type -d -in cipher${type}.bin -out plain${type}.txt -K $K -iv $iv
done