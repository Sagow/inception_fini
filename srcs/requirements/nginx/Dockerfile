FROM alpine:3.7
LABEL author="mdelwaul"
RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y nginx \
	&& apt-get install openssl -l
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx_start.sh /home/docker/script/nginx_start.sh
RUN chmod 744 /home/docker/script/nginx_start.sh
EXPOSE 443
ENTRYPOINT /home/docker/script/nginx_start.sh
WORKDIR /home/docker
CMD [ "nginx -g daemon off;" ]