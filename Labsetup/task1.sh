#!/bin/bash
CUR_DIR=$(pwd)
cd $CUR_DIR/Files
./freq.py
tr 'ytnvfxuzamgihulrpqmlsdcbejkow' 'THEAVOFUCIBLRNWGDSIWKYMFPQXJN' < ciphertext.txt > plaintext_task1.txt 
cat plaintext_task1.txt
