#!/bin/sh

curl --silent -H "Accept: text/html" http://127.0.0.1:43110/1LtvsjbtQ2tY7SCtCZzC4KhErqEK3bXD4n
curl --silent -H "Accept: text/html" http://127.0.0.1:43110/1Bm8RDrnitgbh7Nbsbo6T9j5VDLWTGaar4
NEW_SITES=`sqlite3 /root/data/1LtvsjbtQ2tY7SCtCZzC4KhErqEK3bXD4n/data/zerosites.db "select address from sites order by added desc limit 5;"`
for SITE in $NEW_SITES; do
	echo Check site $SITE >> /root/data/crontab.log
	curl --silent -H "Accept: text/html" http://127.0.0.1:43110/$SITE >> /root/data/crontab.log
done
