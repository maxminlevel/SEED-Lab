#!/bin/bash
set -e
cd Files
./freq.py
tr 'ytnvfxuzamgihulrpqmlsdcbejkow' 'THEAVOFUCIBLRNWGDSIWKYMFPQXJN' < ciphertext.txt > plaintext_task1.txt 
cat plaintext_task1.txt
