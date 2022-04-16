FROM linux:alpine
LABEL author="mdelwaul"
COPY service_start.sh /home/docker/script/service_start.sh
RUN chmod 744 /home/docker/script/service_start.sh
ENTRYPOINT /home/docker/script/service_start.sh
WORKDIR /home/docker