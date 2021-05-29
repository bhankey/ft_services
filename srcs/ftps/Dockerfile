FROM alpine:latest

# Install ftps service software
RUN apk update
RUN apk add vsftpd

# Install openssl and create serificate
RUN apk add openssl
RUN mkdir -p /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/private/vsftpd.crt -subj '/CN=localhost'

# Configure user for connection
ARG user=bhankey
ARG home=/home/$user
ARG password=bhankey
RUN addgroup -S docker
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home $home \
    --ingroup docker \
    $user
RUN mkdir /home/${user}/ftp
RUN echo -e "${password}\n${password}" | passwd ${user}
RUN chown ${user} /home/${user}/ftp

# Copy config of vsftpd
COPY srcs/vsftpd.conf etc/vsftpd


# Copy start.sh, cus vsftpd stops container when i run it by entrypoint (i don't know why)
COPY srcs/start.sh /
RUN chmod +x start.sh

# Expose ports
EXPOSE 21
EXPOSE 20
EXPOSE 40000


ENTRYPOINT [ "/start.sh" ]