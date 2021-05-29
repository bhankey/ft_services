FROM alpine:latest

# Install nginx
RUN apk update
RUN apk add nginx

# Install php
RUN apk add php7-fpm php7-common php7-iconv php7-json php7-gd \
	php7-curl php7-xml php7-mysqli php7-imap php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
	php7-ctype php7-dom php7-session php7-mbstring curl

# Creating new user and group 'www' for nginx
RUN adduser -D -g 'www' www

# Create a directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# Configer nginx
RUN mkdir -p /run/nginx
COPY srcs/default.conf /etc/nginx/conf.d

# Install wordpress
RUN mkdir -p /usr/share/webapps/
ADD http://wordpress.org/latest.tar.gz /usr/share/webapps/
RUN cd /usr/share/webapps && tar xvf latest.tar.gz
RUN rm /usr/share/webapps/latest.tar.gz
RUN chmod -R 777 /usr/share/webapps/
RUN ln -s /usr/share/webapps/wordpress/ /www/
COPY srcs/wp-config.php /usr/share/webapps/wordpress/wp-config.php

# Install supervisord
RUN apk add supervisor
COPY srcs/supervisord.conf /etc/

# Expose ports
EXPOSE 5050

CMD ["/usr/bin/supervisord"]