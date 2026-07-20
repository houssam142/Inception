FROM debian:bookworm 

RUN 	apt-get update &&  \
	apt-get install nginx -y && \
	apt install openssl -y && \
   	rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/hounejja.key \
	-out /etc/ssl/certs/hounejja.crt \
	-subj "/C=MA/ST=KH/L=KH/O=42/OU=42/CN=hounejja.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
