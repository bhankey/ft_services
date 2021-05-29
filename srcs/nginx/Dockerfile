FROM alpine:latest

# Install nginx
RUN apk update
RUN apk add nginx

# SSL sertificate
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/CN=localhost'

# Creating new user and group 'www' for nginx
RUN adduser -D -g 'www' www

# Create a directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# Configer nginx
RUN mkdir -p /run/nginx
COPY srcs/default.conf /etc/nginx/conf.d
COPY srcs/index.html /www

# Install supervisord
RUN apk add supervisor
COPY srcs/supervisord.conf /etc/

# Install openssh
RUN apk add --no-cache openssh

# Generate key for ssh
RUN ssh-keygen -A

# Configure root password for ssh
ARG user=root
ARG password=root
RUN echo -e "${password}\n${password}" | passwd ${user}

# Copy sshd config
COPY srcs/sshd_config /etc/ssh

# Expose ports
EXPOSE 443
EXPOSE 80
EXPOSE 22

CMD [ "/usr/bin/supervisord" ]