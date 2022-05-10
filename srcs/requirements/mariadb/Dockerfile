FROM		debian:buster

COPY		./tools/setup_db.sh			/tmp/
COPY		./conf/create_mysql_db.sql	/tmp/

RUN			apt-get update
RUN			apt-get install -y \
				mariadb-server

RUN			chmod 111 /tmp/setup_db.sh

CMD	["bash", "/tmp/setup_db.sh"]

EXPOSE		3306