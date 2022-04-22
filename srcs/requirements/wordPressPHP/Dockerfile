FROM debian:buster

LABEL mdelwaul <mdelwaul@student.42.fr>

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y mariadb-server wget zip tar \
php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-cgi php7.3-mbstring

WORKDIR /tmp/
COPY tools/ ${WORKDIR}

ENV ADMIN_USER=user
ENV ADMIN_PW=pw
ENV ADMIN_EMAIL=user@email.com
ENV BUILD_DIR=/var/www
RUN mkdir ${BUILD_DIR}

RUN wget -cO latest.tar.gz https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN mkdir -p /run/php

RUN tar xzf latest.tar.gz --directory ${BUILD_DIR} && \
	mv wp-config.php ${BUILD_DIR}/wordpress

RUN sed 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' -i /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

CMD php-fpm7.3 -F -R
