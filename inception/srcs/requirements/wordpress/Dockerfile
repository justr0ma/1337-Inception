FROM debian:buster

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-common \
    php-mysql \
    wget \
    curl \
    unzip


COPY wp-config.php /wp-config.php
COPY script.sh /s.sh
RUN chmod +x /s.sh

CMD ["./s.sh"]

