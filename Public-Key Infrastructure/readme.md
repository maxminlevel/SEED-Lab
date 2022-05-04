
## Lab: [Public-Key Infrastructure](!https://seedsecuritylabs.org/Labs_20.04/Crypto/Crypto_PKI/)

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
* 1: Becoming a Certificate Authority (CA)
* 2: Generating a Certificate Request for Your Web Server
* 3: Generating a Certificate for your server
* 4: Deploying Certificate in an Apache-Based HTTPS Website
* 5: Launching a Man-In-The-Middle Attack
* 6: Launching a Man-In-The-Middle Attack with a Compromised CA
<hr>