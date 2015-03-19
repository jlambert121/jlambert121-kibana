# == Class: kibana::config
#
# This class configures kibana.  It should not be directly called.
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class kibana::config (
  $install_path     = $::kibana::install_path,
  $port             = $::kibana::port,
  $bind             = $::kibana::bind,
  $es_url           = $::kibana::es_url,
  $es_preserve_host = $::kibana::es_preserve_host,
  $kibana_index     = $::kibana::kibana_index,
  $default_app_id   = $::kibana::default_app_id,
  $request_timeout  = $::kibana::request_timeout,
  $shard_timeout    = $::kibana::shard_timeout,
){

  file { "${install_path}/kibana/config/kibana.yml":
    ensure  => 'file',
    owner   => 'kibana',
    group   => 'kibana',
    mode    => '0440',
    content => template('kibana/kibana.yml.erb'),
  }

}
