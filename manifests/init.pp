# == Class: kibana
#
# This class installs and configures kibana3 (http://three.kibana.org/)
#
#
# === Parameters
#
# [*ensure*]
#   String.  What version of kibana should be installed
#   Default: latest
#
# [*es_host*]
#   String. Hostname to reach the elasticsearch server from.  This must be
#     reachable from your browswer.
#
# [*es_port*]
#   Integer.  Port to connect to the elasticsearch server on.
#   Default: 9200
#
# [*modules*]
#   Array of Strings.  Modules that kibana should load
#
# [*logstash*]
#   Boolean.  Enable logstash json logging
#   Default: false
#
#
# === Examples
#
# * Installation:
#     class { 'kibana': }
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
#
# === Copyright
#
# Copyright 2013 EvenUp.
#
class kibana (
  $ensure           = 'latest',
  $es_host          = '',
  $es_port          = 9200,
  $modules          = [ 'histogram','map','table','filtering','timepicker',
                        'text','fields','hits','dashcontrol','column',
                        'derivequeries','trends','bettermap','query','terms' ],
  $logstash_logging = false,
  $default_board    = 'default.json',
) {

  class { 'kibana::package':
    ensure  => $ensure,
  }

  class { 'kibana::config':
    es_host           => $es_host,
    es_port           => $es_port,
    modules           => $modules,
    logstash_logging  => $logstash_logging,
    default_board     => $default_board,
  }

  anchor { 'kibana::begin': }
  anchor { 'kibana::end': }

  Anchor['kibana::begin'] ->
  Class['kibana::package'] ->
  Class['kibana::config'] ->
  Anchor['kibana::end']


}
