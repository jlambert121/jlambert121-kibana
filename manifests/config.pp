# == Class: kibana::configure
#
# This class configures kibana.  It should not be directly called.
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
class kibana::config (
  $es_host,
  $es_port,
  $modules,
) {

  $es_real = $es_host ? {
    ''      => "http://'+window.location.hostname+':${es_port}",
    default => "http://${es_host}:${es_port}"
  }

  file { '/var/www/html/kibana/config.js':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template('kibana/config.js'),
  }

  apache::vhost { 'kibana':
    serverName  => $::fqdn,
    serverAlias => ['kibana.ineu.us'],
    docroot     => '/var/www/html/kibana',
  }

}
