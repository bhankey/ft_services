#!/bin/sh

if ! [ -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	openrc default
	rc-service mariadb start
	until mysqladmin ping >/dev/null 2>&1; do
  	echo -n "."; sleep 0.2
	done
	mysql -u root < create_conf.sql
	rc-service mariadb stop
	rc-service mariadb start
	until mysqladmin ping >/dev/null 2>&1; do
  	echo -n "."; sleep 0.2
	done
	mysql -u root wordpress < wordpress.sql
	rc-service mariadb stop
fi

/usr/bin/mysqld_safe --datadir='/var/lib/mysql'