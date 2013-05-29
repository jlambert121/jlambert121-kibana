#!/bin/bash

if [ ! -d kibana ] ; then
  git clone git://github.com/elasticsearch/kibana.git
else
  git pull
fi

BUILD=`date +%Y%m%d`

fpm -s dir \
    -t rpm \
    -n kibana \
    -v $BUILD \
    --prefix '/var/www/html/kibana' \
    --iteration '1.el6' \
    --license MIT \
    --category 'Applications/Internet' \
    -a 'noarch' \
    --config-files config.js \
    --description 'Kibana is a web interface for Logstash.' \
    --url 'http://kibana.org' \
    --vendor 'kibana.org' \
    --maintainer "Justin Lambert" \
    -x var/www/html/kibana/.git \
    -C kibana .
