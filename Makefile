include srcs/.env
export $(shell sed 's/=.*//' srcs/.env)

up:
	cd srcs && docker-compose up --build -d --remove-orphans && cd ..

down:
	cd srcs && docker-compose down -t 2 && cd ..
	@rm -rf ~/data/mariadb

fdown:
	cd srcs && docker-compose down -t 2 -v && cd ..
	@rm -rf ~/data

clean:
	cd srcs && docker-compose down --rmi all

config:
	cd srcs && docker-compose config

.PHONY: up down fdown clean