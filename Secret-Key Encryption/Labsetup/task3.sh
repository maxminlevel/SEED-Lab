#!/bin/bash
set -e
file=pic_original.bmp
cd Files
rm Task3 -rf
mkdir Task3
cp ${file} Task3/${file}
cd Task3
K=00112233445566778889aabbccddeeff22222222222222323143434234a3aa
iv=0102030405060708
eog -n ${file} &
head -c 54 ${file} > header

# ECB
echo "ECB"
openssl enc -aes-128-ecb -e -in ${file} -out ecb.bmp -K $K
tail -c +55 ecb.bmp > body_ecb
cat header body_ecb > new_ecb.bmp
eog -n new_ecb.bmp &

# CBC
echo "CBC"
openssl enc -aes-128-cbc -e -in ${file} -out cbc.bmp -K $K -iv $iv
tail -c +55 cbc.bmp > body_cbc
cat header body_cbc > new_cbc.bmp
eog -n new_cbc.bmp &
