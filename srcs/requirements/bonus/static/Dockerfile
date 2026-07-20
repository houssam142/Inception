FROM debian:bookworm

RUN apt update && \
	apt install -y \
	npm && \
	rm -rf /var/lib/apt/lists/*

COPY components/index.html /index.html
COPY components/style.css /style.css

COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 5500

ENTRYPOINT ["/setup.sh"]
