FROM debian:bookworm

RUN apt update && \
	apt install -y \
	php-fpm \
	php-mysql \
	mariadb-client \
	curl && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 8080

ENTRYPOINT ["/setup.sh"]
