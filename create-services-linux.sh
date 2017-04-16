#!/bin/bash

docker network create --driver overlay atsea

docker secret create database_password ./devsecrets/postgres_password
docker secret create payment_token ./devsecrets/payment_token

docker service create --network atsea \
 --constraint 'node.labels.os == linux' \
 --env POSTGRES_USER=gordonuser \
 --env POSTGRES_DB_PASSWORD_FILE=/run/secrets/database_password \
 --env POSTGRES_DB=atsea \
 --secret database_password \
 --name database atsea_db

docker service create --network atsea \
 --constraint 'node.labels.os == linux' \
 --publish 8080:8080 \
 --secret database_password \
 --name appserver atsea_app

docker service create --network atsea \
 --constraint 'node.labels.os == linux' \
 --secret payment_token
 --name payment_gateway dockersamples/atseapayment