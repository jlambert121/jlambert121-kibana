# == Class: kibana::config
#
# This class configures kibana.  It should not be directly called.
#
#
class kibana::config (
  $version                = $::kibana::version,
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
  $ping_timeout           = $::kibana::ping_timeout,
  $startup_timeout        = $::kibana::startup_timeout,
  $ssl_cert_file          = $::kibana::ssl_cert_file,
  $ssl_key_file           = $::kibana::ssl_key_file,
  $verify_ssl             = $::kibana::verify_ssl,
  $base_path              = $::kibana::base_path,
  $log_file               = $::kibana::log_file,
){

  if versioncmp($version, '4.2.0') < 0 {
    if $base_path {
      fail('Kibana config: server.basePath is not supported for kibana 4.1 and lower')
    }
    $template = 'kibana-4.0-4.1.yml'
  } else {
    $template = 'kibana-4.2-4.4.yml'
  }

  file { "${install_path}/kibana/config/kibana.yml":
    ensure  => 'file',
    owner   => 'kibana',
    group   => 'kibana',
    mode    => '0440',
    content => template("kibana/${template}.erb"),
  }
}
