install-tools:
	sudo apt-get update
	sudo apt install openssl eog unzip make

setup: 
	cd materials; unzip Labsetup.zip; cp Labsetup/* ../Labsetup -rf; rm Labsetup -rf

hard-clean:
	cd Labsetup; rm Files encryption_oracle docker-compose.yml -rf *.txt

reset: hard-clean
	make setup

task1: 
	cd Labsetup; bash task1.sh >> task1_out.txt

task2: 
	cd Labsetup; bash task2.sh >> task2_out.txt

task3: 
	cd Labsetup; bash task3.sh >> task3_out.txt

task4: 
	cd Labsetup; bash task4.sh >> task4_out.txt

task5: 
	cd Labsetup; bash task5.sh >> task5_out.txt

task6: 
	cd Labsetup; bash task6.sh >> task6_out.txt

task7: 
	cd Labsetup; bash task7.sh >> task7_out.txt

build: reset task1 task2 task3 task4 task5 task6 task7

now: 
	cd Labsetup; bash solution.sh