FROM        debian:buster

RUN         apt-get update
RUN         apt-get install -y \
                nginx
RUN         apt-get install -y \
                openssl

RUN         openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
            -subj "/C=KR/ST=Korea/L=Seoul/O=Seoul42/CN=yejsong.42.fr" \
            -keyout /etc/ssl/private/yejsong.key -out /etc/ssl/certs/yejsong.crt

COPY		./conf/nginx.conf	/tmp/

RUN		rm -rf /etc/nginx/sites-enabled/* && \
		mv tmp/nginx.conf /etc/nginx/sites-available/nginx.conf && \
		ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE      443

CMD         ["nginx", "-g", "daemon off;"]