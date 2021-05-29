FROM alpine:latest

# Install influxdb and create map for saving configs
RUN apk update
RUN apk add influxdb
RUN mkdir -p /var/lib/influxdb

# Expose ports
EXPOSE 8086

ENTRYPOINT [ "/usr/sbin/influxd", "-config", "/etc/influxdb/influxdb.conf" ]