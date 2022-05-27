#!/bin/bash
set -e

mkdir PKIlab
cd PKIlab/

cp /usr/lib/ssl/openssl.cnf ./openssl.cnf

mkdir ./demoCA
cd ./demoCA
mkdir certs
mkdir crl
mkdir newcerts
touch index.txt
echo "1000" > serial
cd ..

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
-keyout ca.key -out ca.crt \
-subj "/CN=www.modelCA.com/O=Model CA LTD./C=US" \
-passout pass:dees

openssl x509 -in ca.crt -text -noout
openssl rsa -in ca.key -text -noout

echo "Completed"