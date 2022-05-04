
## Lab: [RSA Public-Key Encryption and Signature](!https://seedsecuritylabs.org/Labs_20.04/Crypto/Crypto_RSA/)

## Setup
To install: run `make install-tools && make setup`. In case of error, you might want to run the installation step by step via:
```bash
# Install building tools like make
	sudo apt-get update
	sudo apt install openssl eog unzip make

# Setup the project
	cd materials
	unzip Labsetup.zip
	cp Labsetup/* ../Labsetup -rf
	rm Labsetup -rf

# Run task i-th
	make task{i-th}
	Example: make task1

# Reset the project
	make reset (included hard clean and setup process)
```

## Tasks
* 1: Deriving the Private Key
* 2: Encrypting a Message
* 3: Decrypting a Message
* 4: Signing a Signature
* 5: Verifying a Signature
* 6: Manually Verifying an X.509 Certificate
<hr>