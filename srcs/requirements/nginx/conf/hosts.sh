#!/bin/sh

grep -E "listen = 127.0.0.1" /etc/hosts > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "127.0.0.1	www.yejsong.42.fr" >> /etc/hosts
	echo "127.0.0.1 yejsong.42.fr" >> /etc/hosts
fi