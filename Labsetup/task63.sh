#!/bin/bash
set -e
cd Files
rm Task63 -rf
mkdir Task63
cp ../task63.py Task63/
cd Task63

iv_used=b56a1660d24a16882ca36306d70138c9
iv_next=7f11767ad24a16882ca36306d70138c9
key=00112233445566778899aabbccddeeff # only Bob know

./task63.py "Yes" ${iv_used} ${iv_next} > p2
# Verify

openssl enc  -aes-128-cbc  -e -in p2 -out c2 -K ${key} -iv ${iv_next}
xxd -p c2
# 5c4d2e6fd0cc4834c6f84dd68a9101584abbd2f2d8460ed36365ecdbb69c3954
echo -n "5c4d2e6fd0cc4834c6f84dd68a910158" | xxd -r -p > c1
openssl enc  -aes-128-cbc  -d -in c1 -out p1 \
-K ${key} \
-iv ${iv_used}
cat p2
