FROM debian:buster


RUN apt-get update -y && apt-get install mariadb-server -y


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /
RUN chmod +x /script.sh

CMD ["/script.sh"]
