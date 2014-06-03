#!/bin/bash

VERSION=3.1.0
rm -f kibana-${VERSION}.zip
rm -rf kibana-${VERSION}
curl -so kibana-${VERSION}.zip https://download.elasticsearch.org/kibana/kibana/kibana-${VERSION}.zip
unzip kibana-${VERSION}.zip > /dev/null

fpm -s dir \
    -t rpm \
    -n kibana \
    -v $VERSION \
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
    -C kibana-${VERSION} .
