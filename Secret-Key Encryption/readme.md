
## Lab: [Secret-Key Encryption](!https://seedsecuritylabs.org/Labs_20.04/Crypto/Crypto_Encryption/)

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
* 1: Frequency Analysis
* 2: Encryption using Different Ciphers and Modes
* 3: Encryption Mode – ECB vs. CBC
* 4: Padding
* 5: Error Propagation – Corrupted Cipher Text
* 6: Initial Vector (IV) and Common Mistakes
  * 6.1: IV Experiment
  * 6.2: Common Mistake: Use the Same IV
  * 6.3: Common Mistake: Use a Predictable IV
* 7: Programming using the Crypto Library
<hr>