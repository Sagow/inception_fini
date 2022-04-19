FROM debian:buster

LABEL mdelwaul <mdelwaul@student.42.fr>

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y nginx

#recuperation de tous les fichiers necessaires a l'installation
WORKDIR /tmp/
COPY tools/ ${WORKDIR}

ENV BUILD_DIR=/tmp/build/
RUN mkdir ${BUILD_DIR}

#installation de mkcert (pour creer la cle SSL)
RUN chmod 770 mkcert-v1.4.3-linux-amd64 && \
	./mkcert-v1.4.3-linux-amd64 -install && \
	./mkcert-v1.4.3-linux-amd64 localhost && \
	mkdir -p /etc/nginx/ssl/ && \
	mv localhost.pem /etc/nginx/ssl/ && \
	mv localhost-key.pem /etc/nginx/ssl/ && \
	chmod -R 770 /etc/nginx/ssl/

#suppression des trucs plus utiles, genre configuration
RUN rm -rf /etc/nginx/sites-enabled/* && \
	mv nginx.conf /etc/nginx/sites-available/nginx.conf && \
	ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

#port 443 uniquement (https), pas 80 (http)
EXPOSE 443

#daemon on est plutot pour la prod
RUN chmod -R 777 ${BUILD_DIR}

CMD cp -a ${BUILD_DIR}. /var/www/ && \
	nginx -g 'daemon off;'