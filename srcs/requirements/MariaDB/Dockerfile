FROM debian:buster

LABEL mdelwaul <mdelwaul@student.42.fr>

RUN apt-get update && \
	apt-get upgrade -y
RUN apt-get -qq install mariadb-server -y
RUN mkdir -p /run/mysql
EXPOSE 3306

WORKDIR /tmp/mariadb/

#permet d'accepter les connexions de n'importe quel host
RUN 	sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/'\
		 -i /etc/mysql/mariadb.conf.d/50-server.cnf

#copie tous les fichiers neessaires
COPY tools/ /tmp/mariadb/

RUN service mysql start && cat setup_db.sql setup.sql | mariadb -u root

CMD mysqld