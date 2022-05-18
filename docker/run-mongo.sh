#!/bin/sh
source ./.mongo.env;
docker image pull mongo:5;
docker container run -d --name mongo --restart unless-stopped -p 27017:27017 -v mongo-data:/data -e MONGO_INITDB_ROOT_USERNAME="$MONGO_USER" -e MONGO_INITDB_ROOT_PASSWORD="$MONGO_PASS" mongo:5;
