#!/bin/bash
mysqldump -u root -p --no-data --routines aprs > ./data/database-init/aprs.sql
mysqldump -u root -p aprs aprs_icons > ./data/database-init/aprs_icons.sql
