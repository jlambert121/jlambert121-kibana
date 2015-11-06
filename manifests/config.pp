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
  $install_path           = $::kibana::install_path,
  $port                   = $::kibana::port,
  $bind                   = $::kibana::bind,
  $ca_cert                = $::kibana::ca_cert,
  $es_url                 = $::kibana::es_url,
  $es_preserve_host       = $::kibana::es_preserve_host,
  $kibana_index           = $::kibana::kibana_index,
  $elasticsearch_username = $::kibana::elasticsearch_username,
  $elasticsearch_password = $::kibana::elasticsearch_password,
  $default_app_id         = $::kibana::default_app_id,
  $pid_file               = $::kibana::pid_file,
  $request_timeout        = $::kibana::request_timeout,
  $shard_timeout          = $::kibana::shard_timeout,
  $ssl_cert_file          = $::kibana::ssl_cert_file,
  $ssl_key_file           = $::kibana::ssl_key_file,
  $verify_ssl             = $::kibana::verify_ssl,
){

  file { "${install_path}/kibana/config/kibana.yml":
    ensure  => 'file',
    owner   => 'kibana',
    group   => 'kibana',
    mode    => '0440',
    content => template('kibana/kibana.yml.erb'),
  }

}
