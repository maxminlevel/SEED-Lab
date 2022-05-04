#!/bin/bash
set -e
cd Files
rm Task63 -rf
mkdir Task63
cp ../task63.py Task63/
cd Task63

iv_used=31323334353637383930313233343536
iv_next=31323334353637383930313233343537
key=00112233445566778899aabbccddeeff # only Bob know

./task63.py "Yes" ${iv_used} ${iv_next} > p2
openssl enc  -aes-128-cbc  -e -in p2 -out c2 -K ${key} -iv ${iv_next}
xxd -p c2
echo -n "bef65565572ccee2a9f9553154ed9498" | xxd -r -p > c1
openssl enc  -aes-128-cbc  -d -in c1 -out p1 \
-K ${key} \
-iv ${iv_used}
cat p2
