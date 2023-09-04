FROM debian:buster

RUN apt-get update -y
RUN apt-get install nginx wget unzip git -y


COPY conf/selfsigned-nginx.crt /etc/ssl/certs/selfsigned-nginx.crt
COPY conf/selfsigned-nginx.key /etc/ssl/private/selfsigned-nginx.key
RUN echo "ssl_certificate /etc/ssl/certs/selfsigned-nginx.crt;" > /etc/nginx/snippets/self-signed.conf
RUN echo "ssl_certificate_key /etc/ssl/private/selfsigned-nginx.key;" >> /etc/nginx/snippets/self-signed.conf


COPY conf/wordpress.conf /etc/nginx/sites-enabled/wordpress.conf

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
CMD service nginx start
