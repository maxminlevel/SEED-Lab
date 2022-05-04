#!/bin/bash
set -e
# Plaintext (P1): This is a known message!
# Ciphertext (C1): a469b1c502c1cab966965e50425438e1bb1b5f9037a4c159
# Plaintext (P2): (unknown to you)
# Ciphertext (C2): bf73bcd3509299d566c35b5d450337e1bb175f903fafc159

./task62.py "This is a known message!" \
a469b1c502c1cab966965e50425438e1bb1b5f9037a4c159 \
bf73bcd3509299d566c35b5d450337e1bb175f903fafc159 \