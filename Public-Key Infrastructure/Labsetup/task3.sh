#!/bin/bash
set -e

cp /usr/lib/ssl/openssl.cnf ./myCA_openssl.cnf

nano myCA_openssl.cnf
#Edit uncomment copy_extensions = copy
# Extension copying option: use with caution.
copy_extensions = copy

openssl ca -config myCA_openssl.cnf -policy policy_anything \
-md sha256 -days 3650 \
-in server.csr -out server.crt -batch \
-cert ca.crt -keyfile ca.key

openssl x509 -in server.crt -text -noout

echo "Completed"