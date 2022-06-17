#!/bin/bash
source ./env
sudo docker exec -it openaprs-docker_db_1 mytop -u root -h db --password=$MYSQL_ROOT_PASSWORD -s1
