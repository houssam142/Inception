FROM debian:bookworm

RUN apt-get update && \
	apt upgrade -y && \
	apt install -y \
	redis-server && \
	rm -rf /var/lib/apt/lists/*

CMD ["redis-server", "--daemonize", "no", "--protected-mode", "no"]

