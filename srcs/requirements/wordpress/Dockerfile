FROM debian:buster

COPY 		/tools/setup_wp.sh /tmp/

RUN			apt-get update
RUN			apt-get install -y \
				php7.3-fpm \
				php7.3-mysql \
				curl \
				tar

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

RUN wp core download --path=/var/www/wordpress --allow-root
RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*

RUN sed 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' -i /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

CMD			["bash", "/tmp/setup_wp.sh"]
