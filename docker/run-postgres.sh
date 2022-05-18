#!/bin/sh
source ./.postgres.env;
docker image pull postgres:14-alpine;
docker container run -d --name postgres --restart unless-stopped -p 5432:5432 -v postgres-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD="$DB_PASS" postgres:14-alpine;
