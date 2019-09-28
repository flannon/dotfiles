#!/bin/bash

set -e

HOST='%.dlib.nyu.edu'
#HOST=localhost
OLDIFS=$IFS
OUTPUT=./${0}.out

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [[  -z $1 ]]
then
	echo -e "  usage: $0 filename.csv\n"
	exit 1
fi
	
IFS=","
while read DB USER 
do
	PASSWD=$(/usr/bin/pwgen -s 30 1)

	#CREATE DATABASE IF NOT EXISTS $DB;

	/usr/bin/mysql -e "CREATE USER '${USER}'@'${HOST}' identified by '${PASSWD}';"
	/usr/bin/mysql -e "CREATE USER '${USER}'@'localhost' identified by '${PASSWD}';"
	/usr/bin/mysql -e "CREATE DATABASE IF NOT EXISTS ${DB} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
	#/usr/bin/mysql -e "GRANT ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TABLESPACE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, DROP, EVENT, EXECUTE, FILE, INDEX, INSERT, LOCK TABLES, PROCESS, PROXY, REFERENCES, RELOAD, REPLICATION CLIENT, REPLICATION SLAVE, SELECT, SHOW DATABASES, SHOW VIEW, TRIGGER, UPDATE PRIVILEGES ON ${DB} to '${USER}'@'${HOST}' identified by '${PASSWORD}';"
	/usr/bin/mysql -e "GRANT ALL PRIVILEGES ON ${DB}.* to '${USER}'@'${HOST}' identified by '${PASSWORD}';"
	/usr/bin/mysql -e "GRANT ALL PRIVILEGES ON ${DB}.* to '${USER}'@'localhost' identified by '${PASSWORD}';"
	/usr/bin/mysql -e "FLUSH PRIVILEGES;"
	printf "$DB, $USER, $PASSWD\n"
	printf "$DB, $USER, $PASSWD\n" >> $OUTPUT
done < $1
IFS=$OLDIFS


# Data file format
# <db name>, , <user name>
# sites_ztest,admin_ztest
