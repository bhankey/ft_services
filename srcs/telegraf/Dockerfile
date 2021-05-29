FROM alpine:latest

# Install telegraf
RUN printf "http://dl-cdn.alpinelinux.org/alpine/edge/community\n" >> /etc/apk/repositories
RUN apk update
RUN apk add telegraf

ENTRYPOINT [ "telegraf" ]