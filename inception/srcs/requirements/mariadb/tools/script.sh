#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $db_name;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' identified by '$db_pwd';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$db_pwd' WITH GRANT OPTION;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

service mysql stop
mysqld
