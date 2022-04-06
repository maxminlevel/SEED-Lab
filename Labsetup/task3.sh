#!/bin/bash
set -e
cd Files
eog -n pic_original.bmp &
K=00112233445566778889aabbccddeeff22222222222222323143434234a3aa
iv=0102030405060708
head -c 54 pic_original.bmp > header

# ECB
openssl enc -aes-128-ecb -e -in pic_original.bmp -out ecb.bmp -K $K -iv $iv
tail -c +55 ecb.bmp > body_ecb
cat header body_ecb > new_ecb.bmp
eog -n new_ecb.bmp &

# CBC
openssl enc -aes-128-cbc -e -in pic_original.bmp -out cbc.bmp -K $K -iv $iv
tail -c +55 cbc.bmp > body_cbc
cat header body_cbc > new_cbc.bmp
eog -n new_cbc.bmp &
