#!/bin/bash
set -e
./cipher_cons.py "Yes" 31323334353637383930313233343536 31323334353637383930313233343537 > p2
openssl enc  -aes-128-cbc  -e -in p2 -out c2 -K 00112233445566778899aabbccddeeff -iv 31323334353637383930313233343537
xxd -p c2
# bef65565572ccee2a9f9553154ed94983402de3f0dd16ce789e5475779aca405

# Verify
echo -n "bef65565572ccee2a9f9553154ed9498" | xxd -r -p > c1
openssl enc  -aes-128-cbc  -d -in c1 -out p1 \
-K 00112233445566778899aabbccddeeff \
-iv 31323334353637383930313233343536
$cat p2
Yes
