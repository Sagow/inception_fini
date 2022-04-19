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
ENV BUILD_DIR=/tmp/build/
RUN mkdir ${BUILD_DIR}}

RUN mkdir -p /run/php

RUN tar xzf latest.tar.gz --directory ${BUILD_DIR} && \
	mv wp-config.php ${BUILD_DIR} && \
	mv index.php ${BUILD_DIR}


RUN chmod -R 777 ${BUILD_DIR}

RUN sed 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' -i /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod 777 wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp-cli

EXPOSE 9000

CMD cp -a ${BUILD_DIR}. /var/www/ && wp-cli core install --allow-root --title="Wordpress" --admin_name=${ADMIN_USER}} --admin_password=${ADMIN_PW}}} --admin_email=${ADMIN_EMAIL}} --path="/var/www/wordpress/" --url="https://localhost/" && php-fpm7.3 -F -R
