# == Class: kibana
#
# This class installs and configures kibana3 (https://www.elastic.co/products/kibana)
#
#
# === Parameters
#
# [*version*]
#   String.  Version of kibana to install
#
# [*base_url*]
#   String.  HTTP path to fetch kibana package from
#   Default: https://download.elasticsearch.org/kibana/kibana
#
# [*tmp_dir*]
#   String.  Working dir for caching package
#   Default: /tmp
#
# [*install_path*]
#   String.  Location to install kibana
#   Default: /opt
#
# [*port*]
#   Integer.  Port for kibana to listen on
#   Default: 5601
#
# [*es_url*]
#   String.  ElasticSearch path to connect to
#   Default: http://localhost:9200
#
# [*es_preserve_host*]
#   Boolean.
#   Default: true
#
# [*kibana_index*]
#   String.  Index to save searches, visualizations, and dashboards
#   Default: .kibana
#
# [*default_app_id*]
#   String.  The default application to load.
#   Default: discover
#
# [*request_timeout*]
#   Integer.  Time in milliseconds to wait for responses from the back end or elasticsearch.
#   Default: 300000
#
# [*shard_timeout*]
#   String.  Time in milliseconds for Elasticsearch to wait for responses from shards.
#   Default: 0
#
# [*legacy_service_mode*]
#   Boolean. 
#   Default: false
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
class kibana (
  $version             = $::kibana::params::version,
  $base_url            = $::kibana::params::base_url,
  $install_path        = $::kibana::params::install_path,
  $tmp_dir             = $::kibana::params::tmp_dir,
  $port                = $::kibana::params::port,
  $bind                = $::kibana::params::bind,
  $es_url              = $::kibana::params::es_url,
  $es_preserve_host    = $::kibana::params::es_preserve_host,
  $kibana_index        = $::kibana::params::kibana_index,
  $default_app_id      = $::kibana::params::default_app_id,
  $request_timeout     = $::kibana::params::request_timeout,
  $shard_timeout       = $::kibana::params::shard_timeout,
  $legacy_service_mode = $::kibana::params::legacy_service_mode,
) inherits kibana::params {

  if !is_integer($port) {
    fail("Class['kibana']: port must be an integer.  Received: ${port}")
  }
  if !is_integer($request_timeout) or $request_timeout < 1 {
    fail("Class['kibana']: request_timeout must be an integer greater than 0.  Received: ${$request_timeout}")
  }
  if !is_integer($shard_timeout) or $shard_timeout < 0 {
    fail("Class['kibana']: shard_timeout must be an integer 0 or greater.  Received: ${$shard_timeout}")
  }
  validate_absolute_path($install_path)
  validate_absolute_path($tmp_dir)
  validate_bool($es_preserve_host)
  validate_bool($legacy_service_mode)
  
  class { '::kibana::install': } ->
  class { '::kibana::config': } ~>
  class { '::kibana::service': }

  Class['kibana::install'] ~> Class['kibana::service']
}
