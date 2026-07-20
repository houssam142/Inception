FROM debian:bookworm

RUN apt-get update && \
	apt install -y \
	vsftpd \
	netcat-openbsd && \
	rm -rf /var/lib/apt/lists/*

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]

