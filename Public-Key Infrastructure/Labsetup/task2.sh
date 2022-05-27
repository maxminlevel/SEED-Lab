#!/bin/bash
set -e

openssl req -newkey rsa:2048 -sha256 -keyout server.key -out server.csr -subj "/CN=cuong2022.com/O=Bank32 Inc./C=US" -addext "subjectAltName = DNS:cuong2022.com, DNS:cuong2022A.com, DNS:cuong2022B.com" -passout pass:dees

openssl req -in server.csr -text -noout
openssl rsa -in server.key -text -noout

echo "Completed"