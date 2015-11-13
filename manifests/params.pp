# == Class: kibana::params
#
# This class sets default parameters
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class kibana::params {
  $version                = '4.0.1'
  $base_url               = 'https://download.elasticsearch.org/kibana/kibana'
  $ca_cert                = undef
  $install_path           = '/opt'
  $tmp_dir                = '/tmp'
  $port                   = 5601
  $bind                   = '0.0.0.0'
  $es_url                 = 'http://localhost:9200'
  $es_preserve_host       = true
  $kibana_index           = '.kibana'
  $elasticsearch_username = undef
  $elasticsearch_password = undef
  $default_app_id         = 'discover'
  $request_timeout        = 300000
  $shard_timeout          = 0
  $ssl_cert_file          = undef
  $ssl_key_file           = undef
  $verify_ssl             = true
  $group                  = 'kibana'
  $user                   = 'kibana'

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora', 'Scientific', 'Amazon', 'OracleLinux', 'SLC': {

      if versioncmp($::operatingsystemmajrelease, '7') >= 0 {
        $service_provider     = 'systemd'
        $run_path             = '/run/kibana'
      } else {
        $service_provider        = 'init'
        $run_path                = '/var/run'
        $init_script_osdependend = 'kibana.legacy.service.redhat.erb'
      }

    }

    'Debian': {

      if versioncmp($::operatingsystemmajrelease, '8') >= 0 {
        $service_provider = 'systemd'
        $run_path         = '/run/kibana'
      } else {
        $service_provider        = 'init'
        $run_path                = '/var/run'
        $init_script_osdependend = 'kibana.legacy.service.debian.erb'
      }
    }

    'Ubuntu': {

      if versioncmp($::operatingsystemmajrelease, '15') >= 0 {
        $service_provider = 'systemd'
        $run_path         = '/run/kibana'
      } else {
        $service_provider        = 'init'
        $run_path                = '/var/run'
        $init_script_osdependend = 'kibana.legacy.service.debian.erb'
      }
    }

    'OpenSuSE': {
      $service_provider  = 'systemd'
      $run_path          = '/run/kibana'
    }

    default: {
      $service_provider        = 'init'
      $run_path                = '/var/run'
      $init_script_osdependend = 'kibana.legacy.service.redhat.erb'
    }
  }

  $pid_file               = "${run_path}/kibana.pid"
}
