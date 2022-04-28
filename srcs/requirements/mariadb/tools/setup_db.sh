#!/bin/sh

sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -d /var/lib/mysql/$DB_NAME ]; then
  service mysql start
  mysql -e "\
    CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; \
    CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
    GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%'; \
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; \
    FLUSH PRIVILEGES; \
    "
  mysqladmin --user=root --password=$DB_ROOT_PASSWORD
  service mysql stop
fi

chown -R mysql:mysql /var/lib/mysql

mysqld_safe