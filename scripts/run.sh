#!/bin/bash
docker run --name=openaprs \
    -v `pwd`/data/openstomp/etc:/root/openstomp/etc \
    -v `pwd`/data/openstomp/logs:/root/openstomp/logs \
    -v `pwd`/data/aprsfeed/logs:/root/aprsfeed/logs \
    -v `pwd`/data/aprsfeed/bursts:/root/aprsfeed/bursts \
    openaprs
