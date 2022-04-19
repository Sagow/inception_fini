FROM debian:buster

LABEL mdelwaul <mdelwaul@student.42.fr>

RUN apt-get update && \
	apt-get upgrade -y

WORKDIR /tmp/mariadb/

#copie tous les fichiers neessaires
COPY tools/ /tmp/mariadb/

RUN mkdir -p /run/mysql

RUN apt-get -qq install mariadb-server -y

RUN service mysql start && mariadb -u root < /tmp/mariadb/setup.sql

#permet d'accepter les connexions de n'importe quel host
RUN 	sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/'\
		 -i /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir temp_mysql/
RUN cp -r /var/lib/mysql/* temp_mysql

EXPOSE 3306

CMD cp -r temp_mysql/* /var/lib/mysql/ && mysqld