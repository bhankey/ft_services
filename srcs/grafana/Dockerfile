FROM alpine:latest

# Install grafana
RUN printf "http://dl-cdn.alpinelinux.org/alpine/edge/community\n" >> /etc/apk/repositories
RUN apk update
RUN apk add grafana

# Copy grafana config to connect DB
COPY srcs/grafana.ini /etc

# Copy datasource.yaml to provisioning path
COPY /srcs/provisioning/datasources/datasource.yaml /usr/share/grafana/conf/provisioning/datasources

# Copy dashboards configs
COPY /srcs/provisioning/dashboards/local.yaml /usr/share/grafana/conf/provisioning/dashboards
COPY /srcs/provisioning/dashboards/services.json /dashboards/services.json
COPY /srcs/provisioning/dashboards/ftps_dash.json /dashboards/
COPY /srcs/provisioning/dashboards/grafana_dash.json /dashboards/
COPY /srcs/provisioning/dashboards/influxdb_dash.json /dashboards/
COPY /srcs/provisioning/dashboards/mysql_dash.json /dashboards/
COPY /srcs/provisioning/dashboards/nginx_dash.json /dashboards/
COPY /srcs/provisioning/dashboards/phpmyadmin_dash.json /dashboards/
COPY /srcs/provisioning/dashboards/telegraf_dash.json /dashboards/
COPY /srcs/provisioning/dashboards/wordpress_dash.json /dashboards/

# Expose ports
EXPOSE 3000

CMD [ "grafana-server", "-homepath", "/usr/share/grafana", "-config", "/etc/grafana.ini" ]