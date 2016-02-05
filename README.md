[![Puppet Forge](http://img.shields.io/puppetforge/v/jlambert121/kibana.svg)](https://forge.puppetlabs.com/jlambert121/kibana)
[![Build Status](https://travis-ci.org/jlambert121/jlambert121-kibana.png?branch=master)](https://travis-ci.org/jlambert121/jlambert121-kibana)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with kibana](#setup)
    * [What kibana affects](#what-kibana-affects)
    * [Beginning with kibana](#beginning-with-kibana)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
8. [Changelog/Contributors](#changelog-contributors)


## Overview

Puppet module to install and configure Kibana 4.

## Module Description

This module installs kibana 4 (https://www.elastic.co/products/kibana), commonly used as part of the ELK stack (Elasticsearch, Logstash, Kibana).

## Setup

### What kibana affects

* Kibana package
* Kibana service

### Beginning with kibana

Installation of the kibana module:

```
  puppet module install jlambert121-kibana
```

## Usage

Installation:

```puppet
    class { 'kibana': }
```

## Reference

### Public methods

#### Class: kibana

Main class for managing kibana.

#####`version`
String.  Version of kibana to install

Default: '4.0.1'

#####`base_url`
String.  HTTP path to fetch kibana package from

Default: https://download.elasticsearch.org/kibana/kibana


#####`tmp_dir`
String.  Working dir for caching package

Default: /tmp


#####`install_path`
String.  Location to install kibana

Default: /opt


#####`port`
Integer.  Port for kibana to listen on

Default: 5601


#####`es_url`
String.  ElasticSearch path to connect to

Default: http://localhost:9200


#####`es_preserve_host`
Boolean.

Default: true


#####`kibana_index`
String.  Index to save searches, visualizations, and dashboards

Default: .kibana


#####`default_app_id`
String.  The default application to load.

Default: discover


#####`request_timeout`
Integer.  Time in milliseconds to wait for responses from the back end or elasticsearch.

Default: 300000


#####`shard_timeout`
String.  Time in milliseconds for Elasticsearch to wait for responses from shards.

Default: 0


### Private classes

* `kibana::params`: Default parameters
* `kibana::install`: Installs kibana package
* `kibana::config`: Configures Kibana
* `kibana::service`: Manages the kibana service

## Limitations

* Only tested on Centos 6

## Development

Improvements and bug fixes are greatly appreciated.  See the [contributing guide](https://github.com/jlambert121/jlambert121-kibana/CONTRIBUTING.md) for
information on adding and validating tests for PRs.


## Changelog / Contributors

[Changelog](https://github.com/jlambert121/jlambert121-kibana/blob/master/CHANGELOG)

[Contributors](https://github.com/jlambert121/jlambert121-kibana/graphs/contributors)
