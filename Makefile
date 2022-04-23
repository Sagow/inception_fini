include srcs/.env
export $(shell sed 's/=.*//' srcs/.env)

up:
	sudo mkdir -p /home/mdelwaul/data/wordpress
	sudo mkdir -p /home/mdelwaul/data/mysql
	cd srcs && docker-compose up --build -d --remove-orphans && cd ..

down:
	cd srcs && docker-compose down && cd ..

fdown:
	cd srcs && docker-compose down -v && cd ..
	@sudo rm -rf /home/mdelwaul/data/wordpress
	@sudo rm -rf /home/mdelwaul/data/mysql

clean:
	cd srcs && docker-compose down --rmi all

config:
	cd srcs && docker-compose config

.PHONY: up down fdown clean