#!/bin/bash
set -e
# Plaintext (total 21 characters): This is a top secret.
# Ciphertext (in hex format): 764aa26b55a4da654df6b19e4bce00f4ed05e09346fb0e762583cb7da2ac93a2
# IV (in hex format): aabbccddeeff00998877665544332211
./task7.py "This is a top secret." \
764aa26b55a4da654df6b19e4bce00f4ed05e09346fb0e762583cb7da2ac93a2 \
aabbccddeeff00998877665544332211
# find the key: Syracuse########