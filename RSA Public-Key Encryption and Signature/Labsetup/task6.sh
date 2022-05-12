#!/bin/bash
set -e
# Step 1: Download a certificate from a real web server

# Download certificated
URL="www.hcmus.edu.vn"
openssl s_client -connect ${URL}:443 -showcerts > ssl.txt
raw_ssl=$(cat ssl.txt)
echo ${raw_ssl}

# substring raw_ssl -> c0.pem and c1.pem file
echo "Manually get the first and secondk certification to c0.pem and c1.pem"

# Step 2: Extract the public key (e, n) from the issuer’s certificate
echo "n"
openssl x509 -in c1.pem -noout -modulus
echo "e"
openssl x509 -in c1.pem -text -noout | grep Exponent

# Step 3: Extract the signature from the server’s certificate
openssl x509 -in c0.pem -text -noout 
echo "Manually get the last signature to signature.txt"
echo "S"
cat signature.txt | tr -d '[:space:]:'

# Step 4: Extract the body of the server’s certificate.
openssl asn1parse -i -in c0.pem

openssl asn1parse -i -in c0.pem -strparse 4 -out c0_body.bin -noout

sha256sum c0_body.bin
echo "Manually copy hash to file task6.py"
python3 ./task6.py

# Step 5: Verify the signature
gcc task6.c -lcrypto
./a.out
rm a.out

echo "Completed"