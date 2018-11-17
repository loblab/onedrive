#!/bin/bash

docker-compose down
rm -rf data
rm onedrive1/items.sqlite3
docker-compose up onedrive1

