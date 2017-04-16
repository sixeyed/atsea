#!/bin/bash

docker network create --driver overlay atsea

docker secret create database_password ./devsecrets/mssql_password
docker secret create payment_token ./devsecrets/payment_token

docker service create --network atsea --endpoint-mode dnsrr \
 --constraint 'node.labels.os == windows' \
 --publish mode=host,target=1433,published=1433 \
 --name database sixeyed/atseadb:mssql

docker service create --network atsea --endpoint-mode dnsrr \
 --constraint 'node.labels.os == linux' \
 --publish mode=host,target=8080,published=8080 \
 --secret database_password \
 --name appserver sixeyed/atsea-app:mssql \
 "--spring.profiles.active=sqlserver" 

docker service create --network atsea --endpoint-mode dnsrr \
 --constraint 'node.labels.os == linux' \
 --secret payment_token \
 --name payment_gateway dockersamples/atseapayment


 ###


  docker service create --network atsea --endpoint-mode dnsrr \
 --constraint 'node.labels.os == linux' \
 --publish mode=host,target=80,published=80 \
 --name temp nginx

 