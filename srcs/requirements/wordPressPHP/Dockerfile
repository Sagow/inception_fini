FROM linux:alpine

LABEL mdelwaul <mdelwaul@student.42.fr>
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y mariadb-server wget zip tar \
php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-cgi php7.3-mbstring


COPY * /root/wordpress

RUN chmod u+x /root/wordpress/starting.sh

CMD [ "/root/wordpress/starting.sh" ]
WORKDIR /home/docker