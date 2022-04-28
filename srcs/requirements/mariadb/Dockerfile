FROM		debian:buster

COPY		./tools/setup_db.sh			/tmp/

RUN			apt-get update
RUN			apt-get install -y \
				mariadb-server

RUN			chmod 111 /tmp/setup_db.sh

ENTRYPOINT	["bash", "/tmp/setup_db.sh"]

EXPOSE		3306