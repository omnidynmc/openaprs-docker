#!/bin/bash
source ./env
sudo docker exec -it openaprs-docker_db_1 mysql -u root --password=$MYSQL_ROOT_PASSWORD
