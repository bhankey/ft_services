#!/bin/bash

#   Start minikube
minikube start  --vm-driver=virtualbox --cpus=5

#   Apply config of load balanser

minikube addons enable metallb
kubectl apply -f srcs/metalLB/metallb.yaml

#   Make containers build in minikube

eval $(minikube docker-env)

#   Build imanges

docker build -t=nginx_image srcs/nginx
docker build -t=mysql_image srcs/mysql
docker build -t=phpmyadmin_image srcs/phpmyadmin
docker build -t=wordpress_image srcs/wordpress
docker build -t=ftps_image srcs/ftps

#	Make shure that we build all

docker build -t=nginx_image srcs/nginx
docker build -t=mysql_image srcs/mysql
docker build -t=phpmyadmin_image srcs/phpmyadmin
docker build -t=wordpress_image srcs/wordpress
docker build -t=ftps_image srcs/ftps
docker build -t=grafana_image srcs/grafana
docker build -t=influxdb_image srcs/influxdb
docker build -t=telegraf_image srcs/telegraf

#   Make deployments & services in minikube

kubectl apply -f srcs/nginx/nginx_deployment.yaml
kubectl apply -f srcs/nginx/nginx_service.yaml

kubectl apply -f srcs/mysql/mysql_volume.yaml
kubectl apply -f srcs/mysql/mysql_deployment.yaml
kubectl apply -f srcs/mysql/mysql_service.yaml

kubectl apply -f srcs/phpmyadmin/phpmyadmin_deployment.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin_service.yaml

kubectl apply -f srcs/wordpress/wordpress_deployment.yaml
kubectl apply -f srcs/wordpress/wordpress_service.yaml

kubectl apply -f srcs/ftps/ftps_deployment.yaml
kubectl apply -f srcs/ftps/ftps_service.yaml

kubectl apply -f srcs/influxdb/influxdb-config.yaml 
kubectl apply -f srcs/influxdb/influxdb_volume.yaml
kubectl apply -f srcs/influxdb/influxdb_deployment.yaml
kubectl apply -f srcs/influxdb/influxdb_service.yaml

kubectl apply -f srcs/grafana/grafana_deployment.yaml
kubectl apply -f srcs/grafana/grafana_service.yaml

kubectl apply -f srcs/telegraf/telegraf-config.yaml 
kubectl apply -f srcs/telegraf/telegraf-secrets.yaml
kubectl apply -f srcs/telegraf/telegraf_deployment.yaml

#   Start dashboard

minikube dashboard &