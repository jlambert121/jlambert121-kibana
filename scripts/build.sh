#!/bin/bash

# Clean up old "latest" and download a new one
rm -f kibana-latest.zip
rm -rf kibana-latest
curl -so kibana-latest.zip http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip
unzip kibana-latest.zip > /dev/null

BUILD=`date +%Y%m%d`

# Make package
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
    -C kibana-latest .
