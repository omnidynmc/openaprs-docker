#!/bin/bash
mysqldump -u root -p --no-data aprs > aprs.sql
mysqldump -u root -p --no-data aprs aprs_icons > aprs_icons.sql
