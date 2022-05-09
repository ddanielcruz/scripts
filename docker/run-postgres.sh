#!/bin/sh
docker image pull postgres:14-alpine;
docker container run -d --name postgres --restart always -p 5432:5432 -v postgres-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD="$DB_PASS" postgres:14-alpine;
