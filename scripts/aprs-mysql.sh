#!/bin/bash
source ./env
sudo docker exec -it openaprs-docker_db_1 mysql -u$DATABASE_USER -h db --password=$DATABASE_PASSWORD aprs
