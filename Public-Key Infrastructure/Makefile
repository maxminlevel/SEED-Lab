install-tools:
	sudo apt-get update
	sudo apt install openssl eog unzip make

setup: 
	@cd materials; unzip Labsetup.zip; cp Labsetup/* ../Labsetup -rf; rm Labsetup -rf

hard-clean:
	@cd Labsetup; rm Files encryption_oracle docker-compose.yml -rf *.txt

reset: hard-clean
	make setup

task1: 
	@cd Labsetup; bash task1.sh

task2: 
	@cd Labsetup; bash task2.sh

task3: 
	@cd Labsetup; bash task3.sh

task4: 
	@cd Labsetup; bash task4.shinstall-tools:
	sudo apt-get update
	sudo apt install openssl eog unzip make

setup: 
	@cd materials; unzip Labsetup.zip; cp Labsetup/* ../Labsetup -rf; rm Labsetup -rf

hard-clean:
	@cd Labsetup; rm Files encryption_oracle docker-compose.yml -rf *.txt

reset: hard-clean
	make setup

task1: 
	@cd Labsetup; bash task1.sh

task2: 
	@cd Labsetup; bash task2.sh

task3: 
	@cd Labsetup; bash task3.sh

task4: 
	@cd Labsetup; bash task4.sh

task5: 
	@cd Labsetup; bash task5.sh

task61: 
	@cd Labsetup; bash task61.sh
task62: 
	@cd Labsetup; bash task62.sh
task63: 
	@cd Labsetup; bash task63.sh

task7: 
	@cd Labsetup; bash task7.sh

build: reset task1 task2 task3 task4 task5 task61 task62 task63 task7
	@echo "Complete"

task5: 
	@cd Labsetup; bash task5.sh

task6:
	@cd Labsetup; bash task6.sh

task7: 
	@cd Labsetup; bash task7.sh

build: reset task1 task2 task3 task4 task5 task6 task7
	@echo "Complete"