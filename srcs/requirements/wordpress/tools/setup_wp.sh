#!bin/bash/
mkdir -p /run/php/
  echo "env[DB_HOST] = \$DB_HOST" >> /etc/php/7.3/fpm/pool.d/www.conf
  echo "env[DB_USER] = \$DB_USER" >> /etc/php/7.3/fpm/pool.d/www.conf
  echo "env[DB_PASSWORD] = \$DB_PASSWORD" >> /etc/php/7.3/fpm/pool.d/www.conf
  echo "env[DB_NAME] = \$DB_NAME" >> /etc/php/7.3/fpm/pool.d/www.conf
cp /tmp/wp-config.php /var/www/wordpress/wp-config.php
sleep 10
if [ ! -f /var/www/wordpress/wp-config.php ]
then
wp config create	--allow-root \
					--skip-check \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASSWORD \
					--dbhost=$DB_HOST \
					--dbprefix=wp_ \
					--path=/var/www/wordpress
wp config set WP_CACHE_KEY_SALT $WP_URL
sleep 10
fi

wp core install		--allow-root \
					--url="$WP_URL" \
					--title=test_site \
					--admin_user="$WP_ADMIN" \
					--admin_password="$WP_ADMIN_PASSWORD" \
					--admin_email="$WP_ADMIN_EMAIL" \
					--path=/var/www/wordpress

#wp user create bob	"$WP_REG_USER@$WP_URL" \
#					--allow-root \
#					--role=author \
#					--user_pass=$WP_REG_USER_PASSWORD \
#					--path=/var/www/wordpress

/usr/sbin/php-fpm7.3 -F --nodaemonize