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
# [*ca_cert*]
#   String: Path to ca cert (PEM formatted)
#   Default: undef
#
# [*tmp_dir*]
#   String.  Working dir for caching package
#   Default: /tmp
#
# [*elasticsearch_username*}
#   String. The Elasticsearch user
#   Default: undef
#
# [*elasticsearch_password*]
#   String. The Elasticsearch password
#   Default: undef
#
# [*pid_file*]
#   String. Path to the pid file
#   Defailt: /var/run/kibana.pid
#
# [*install_path*]
#   String.  Location to install kibana
#   Default: /opt
#
# [*port*]
#   Integer.  Port for kibana to listen on
#   Default: 5601
#
# [*bind*]
#   String. IP Address for kibana to listen on
#   Default: 0.0.0.0
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
# [*ssl_cert_file*]
#   String. Path to ssl key file (PEM formatted).
#   Default: undef
#
# [*ssl_key_file*]
#   String. Path to ssl cert file (PEM formatted).
#   Default: undef
#
# [*shard_timeout*]
#   String.  Time in milliseconds for Elasticsearch to wait for responses from shards.
#   Default: 0
#
# [*legacy_service_mode*]
#   Boolean.
#   Default: false
#
# [*verify_ssl*]
#   Boolean.
#   Default: true
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
  $version                       = $::kibana::params::version,
  $base_url                      = $::kibana::params::base_url,
  $ca_cert                       = $::kibana::params::ca_cert,
  $install_path                  = $::kibana::params::install_path,
  $tmp_dir                       = $::kibana::params::tmp_dir,
  $port                          = $::kibana::params::port,
  $bind                          = $::kibana::params::bind,
  $es_url                        = $::kibana::params::es_url,
  $es_preserve_host              = $::kibana::params::es_preserve_host,
  $kibana_index                  = $::kibana::params::kibana_index,
  $elasticsearch_username        = $::kibana::params::elasticsearch_username,
  $elasticsearch_password        = $::kibana::params::elasticsearch_password,
  $default_app_id                = $::kibana::params::default_app_id,
  $pid_file                      = $::kibana::params::pid_file,
  $request_timeout               = $::kibana::params::request_timeout,
  $shard_timeout                 = $::kibana::params::shard_timeout,
  $ssl_cert_file                 = $::kibana::params::ssl_cert_file,
  $ssl_key_file                  = $::kibana::params::ssl_key_file,
  $verify_ssl                    = $::kibana::params::verify_ssl,
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
  validate_absolute_path($pid_file)
  validate_bool($es_preserve_host)
  validate_bool($verify_ssl)

  class { '::kibana::install': } ->
  class { '::kibana::config': } ~>
  class { '::kibana::service': }

  Class['kibana::install'] ~> Class['kibana::service']
}
