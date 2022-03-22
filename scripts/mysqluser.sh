#!/bin/bash
source ./env
sudo docker exec -it openaprs-docker_db_1 mysql -u root --password=$MYSQL_ROOT_PASSWORD -e "DROP USER '$DATABASE_USER'"
sudo docker exec -it openaprs-docker_db_1 mysql -u root --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PASSWORD'"
sudo docker exec -it openaprs-docker_db_1 mysql -u root --password=$MYSQL_ROOT_PASSWORD -e "GRANT INSERT, SELECT, UPDATE, DELETE, CREATE, ALTER, DROP, EXECUTE ON aprs.* TO aprs@'%'"
sudo docker exec -it openaprs-docker_db_1 mysql -u root --password=$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES"
