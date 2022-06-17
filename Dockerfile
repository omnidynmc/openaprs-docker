# Download base image ubuntu 20.04
FROM ubuntu:20.04 as base

# LABEL about the custom image
LABEL maintainer="gcarter@openaprs.net"
LABEL version="0.1"
LABEL description="Docker image for OpenAPRS system."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

ADD ./buildworld.sh /root/buildworld.sh

# Update Ubuntu Software repository
RUN apt-get update

# Install nginx, php-fpm and supervisord from ubuntu repository
RUN apt-get install -y nginx php-fpm supervisor git automake autotools-dev autoconf libtool libc-bin libc6 libc6-dev libcxxtools-dev libossp-uuid-dev libreadline-dev libc++-dev binutils gcc g++ \
                       zlib1g zlib1g-dev libpthread-stubs0-dev make pkg-config libmemcached-dev memcached mysql-server mysql-client libmysqlclient-dev libmysql++ mosquitto mosquitto-clients \
                       cmake cmake-gui cmake-curses-gui libssl-dev logrotate cron

RUN \
    cd /root && \
    git clone https://github.com/eclipse/paho.mqtt.c.git && \
    cd paho.mqtt.c && \
    git checkout v1.3.8 && \
    cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON && \
    cmake --build build/ --target install && \
    ldconfig

RUN \
    cd /root && \
    git clone https://github.com/eclipse/paho.mqtt.cpp && \
    cd paho.mqtt.cpp && \
    cmake -Bbuild -H. -DPAHO_BUILD_STATIC=ON -DPAHO_BUILD_DOCUMENTATION=FALSE -DPAHO_BUILD_SAMPLES=FALSE && \
    cmake --build build/ --target install && \
    ldconfig


# Define the ENV variable
ENV nginx_vhost /etc/nginx/sites-available/default
ENV php_conf /etc/php/7.4/fpm/php.ini
ENV nginx_conf /etc/nginx/nginx.conf
ENV supervisor_conf /etc/supervisor/supervisord.conf

# Enable PHP-fpm on nginx virtualhost configuration
COPY default ${nginx_vhost}
RUN sed -i -e 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' ${php_conf} && \
    echo "\ndaemon off;" >> ${nginx_conf}
    
# Copy supervisor configuration
COPY supervisord.conf ${supervisor_conf}

# Copy crontab configuration
COPY config/crontab/cron.daily /etc/cron.daily

# Copy logrotate configuration
COPY config/logrotate/logrotate.d /etc/logrotate.d

RUN mkdir -p /run/php && \
    chown -R www-data:www-data /var/www/html && \
    chown -R www-data:www-data /run/php
    
# Volume configuration
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Copy start.sh script and define default command for the container
COPY start.sh /start.sh
CMD ["./start.sh"]

# Expose Port for the Application 
EXPOSE 80 443

################################################################################ 
## Production                                                                 ##
################################################################################ 

FROM base as openaprs-prod

RUN rm -rf /var/lib/apt/lists/* && \
    apt clean

RUN \
    cd /root && \
    git clone https://github.com/omnidynmc/openframe.git && \
    git clone https://github.com/omnidynmc/openstomp.git && \
    git clone https://github.com/omnidynmc/stompclient.git && \
    git clone https://github.com/omnidynmc/opensat.git && \
    git clone https://github.com/omnidynmc/openstats.git && \
    git clone https://github.com/omnidynmc/aprsfeed.git && \
    git clone https://github.com/omnidynmc/aprsinject.git && \
    git clone https://github.com/omnidynmc/aprscreate.git && \
    git clone https://github.com/omnidynmc/openaprs.git && \
    git clone https://github.com/omnidynmc/apnspusher.git && \
    git clone https://github.com/omnidynmc/aprspruner.git && \
    git clone https://github.com/omnidynmc/apns.git && \
    git clone https://github.com/omnidynmc/aprs.git && \
    ./buildworld.sh

################################################################################ 
## Debug                                                                      ##
################################################################################ 

FROM base as openaprs-debug

ADD ./rootssh/id_rsa /root/.ssh/id_rsa

RUN apt-get install -y libssl-dev nano ssh gdb && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

RUN \
    git config --global user.email "gcarter@openaprs.net" && \
    git config --global user.name "Gregory Carter"

RUN \
    cd /root/.ssh && \
    ssh-keyscan github.com >> githubKey && \
    ssh-keygen -lf githubKey && \
    mv githubKey known_hosts

RUN \
    cd /root && \
    git clone git@github.com:omnidynmc/openframe.git && \
    git clone git@github.com:omnidynmc/openstomp.git && \
    git clone git@github.com:omnidynmc/stompclient.git && \
    git clone git@github.com:omnidynmc/opensat.git && \
    git clone git@github.com:omnidynmc/openstats.git && \
    git clone git@github.com:omnidynmc/aprsfeed.git && \
    git clone git@github.com:omnidynmc/aprsinject.git && \
    git clone git@github.com:omnidynmc/aprscreate.git && \
    git clone git@github.com:omnidynmc/openaprs.git && \
    git clone git@github.com:omnidynmc/apnspusher.git && \
    git clone git@github.com:omnidynmc/apns.git && \
    git clone git@github.com:omnidynmc/aprs.git && \
    git clone git@github.com:omnidynmc/aprspruner.git && \
    ./buildworld.sh
