#!/bin/bash

mkdir /var/www/
mkdir /var/www/html
mkdir /var/www/html/wordpress/
cd /var/www/html/wordpress/
rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
cp /wp-config.php /var/www/html/wordpress/wp-config.php

sed -i -r "s/justdb/$db_name/1"   wp-config.php
sed -i -r "s/justuser/$db_user/1"  wp-config.php
sed -i -r "s/justpwd/$db_pwd/1"    wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm7.3 -F


