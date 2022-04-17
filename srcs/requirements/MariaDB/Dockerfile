FROM linux:alpine
LABEL author="mdelwaul"
COPY maria_start.sh /home/docker/script/maria_start.sh
RUN chmod 744 /home/docker/script/maria_start.sh
ENTRYPOINT /home/docker/script/maria_start.sh
WORKDIR /home/docker