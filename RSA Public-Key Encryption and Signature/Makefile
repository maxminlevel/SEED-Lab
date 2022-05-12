install-tools:
	sudo apt-get update
	sudo apt install openssl

setup: 
	@cd materials;

hard-clean:
	@cd Labsetup; rm task1.txt task2.txt task3.txt task4.txt task5.txt

reset: hard-clean
	make setup

task1: 
	@cd Labsetup; gcc task1.c -lcrypto; ./a.out >> task1.txt; rm a.out

task2: 
	@cd Labsetup; gcc task2.c -lcrypto; ./a.out >> task2.txt; rm a.out

task3: 
	@cd Labsetup; gcc task3.c -lcrypto; ./a.out >> task3.txt; rm a.out

task4: 
	@cd Labsetup; gcc task4.c -lcrypto; ./a.out >> task4.txt; rm a.out

task5: 
	@cd Labsetup; gcc task5.c -lcrypto; ./a.out >> task5.txt; rm a.out

task6:
	@cd Labsetup; bash task6.sh

build: reset task1 task2 task3 task4 task5 task6
	@echo "Complete"

example/bn:
	@cd materials; gcc bn_sample.c -lcrypto; ./a.out; rm a.out