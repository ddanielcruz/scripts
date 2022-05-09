#!/bin/sh
docker image pull bitnami/redis:6.2;
docker container run -d --name redis --restart always -p 6379:6379 -e ALLOW_EMPTY_PASSWORD=no -e REDIS_PASSWORD="$REDIS_PASS" -v redis-data:/bitnami/redis/data bitnami/redis:6.2;
