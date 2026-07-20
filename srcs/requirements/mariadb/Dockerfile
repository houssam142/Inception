FROM debian:bookworm

RUN apt update && \
	apt install -y mariadb-server vim && \
	rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/create_db.sh /create_db.sh

RUN chmod +x /create_db.sh

EXPOSE 3306

ENTRYPOINT ["/create_db.sh"]
