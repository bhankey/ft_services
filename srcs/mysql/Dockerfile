FROM alpine:latest

# Install mysql
RUN apk update
RUN apk add --no-cache mysql mysql-client

# Install openrc for start
RUN apk add openrc

# Copy files
COPY srcs/create_conf.sql /
COPY srcs/wordpress.sql /
COPY srcs/start.sh /
COPY srcs/my.cnf /etc
RUN mkdir /run/mysqld
RUN chown -R mysql /run/mysqld

RUN chmod +x start.sh

# Expose ports
EXPOSE 3306

ENTRYPOINT ["/start.sh"]