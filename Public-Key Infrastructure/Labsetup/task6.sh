#!/bin/bash
set -e

openssl req -newkey rsa:2048 -sha256 -keyout fb.key -out fb.csr -subj "/CN=facebook.com/O=Bank32 Inc./C=US" -passout pass:dees

#Use CSR to certificate for facebook.com
root@0d457c8d7524:/volumes/PKIlab# cat fb.csr
-----BEGIN CERTIFICATE REQUEST-----
MIICfzCCAWcCAQAwOjEVMBMGA1UEAwwMZmFjZWJvb2suY29tMRQwEgYDVQQKDAtC
YW5rMzIgSW5jLjELMAkGA1UEBhMCVVMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDGKfZQ0mwscEU3ojFEeOqjwTa2QJRcsjJNQ/MRouDyG4Ko6UyMPa+M
Ooctyqn8KvM0h8bEIAsOd2Hnx6Hx1pDahaGdBrw3H8hoENDj227e6Wt6gRfDwRBg
IyNJ2sXpNWsT8NdP8mj2wNoWLPnw2da4yHEEjOPjJ7hBNeEQ9RiqCYdIgo84RWYi
x6yT86SiGTIfypzl+LNvpO+zKpUu4YUaFtqGsj4Q0xDc58MLoTS96oPDU1vNJNNZ
ga+ObNstlvzDRHPa9XPfO0Tl5v7x9gNU9n8vewP8wtZwizkQgc2KjmLORX01Pn8R
wEwNdEPr7OmheiY9rHtGzS8D3hNNHoTFAgMBAAGgADANBgkqhkiG9w0BAQsFAAOC
AQEACHk6TdHYb9uhWmCVbomwSDFYRO9ybfWe2kSXc5TSf17/B1NlLEhqnwL4txcT
uRYmIrEfdeM3e2ANpkUpEJ99578FKLgejzubMDptvdgLla9IlhqX8eC+q/R4PseT
IZOYg5adBJWR420zTj9IN2gaxwjUnhweMpt9ixnKaQ2MnFo+MA9sE4HxoQZKyQvS
ctyoAwPTVPuU0bCup+utjRfk07y1/rP51ugA66thIipP7tX2skfAWdyON26BOmfW
aCjTuAIo9YjiWnX2ojUyisU3GCOc2J/IQRWOev/ExHmX53L6XOGyqTFxQlEOce2R
6LLs/ACCuwoGdkq09Y86bItf2w==
-----END CERTIFICATE REQUEST-----
root@0d457c8d7524:/volumes/PKIlab#

#run
apachectl configtest
service apache2 restart
echo "Completed"