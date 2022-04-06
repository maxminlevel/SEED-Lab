#!/bin/bash
set -e
cd Files
./freq.py
tr 'ytnvfxuzamgihulrpqmlsdcbejkow' 'THEAVOFUCIBLRNWGDSIWKYMFPQXJN' < ciphertext.txt > plaintext.txt 
cat plaintext.txt
