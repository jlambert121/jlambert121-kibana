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
  $es_host            = '',
  $es_port            = 9200,
  $modules            = [ 'histogram','map','table','filtering','timepicker',
                        'text','fields','hits','dashcontrol','column',
                        'derivequeries','trends','bettermap','query','terms' ],
  $logstash_logging   = false,
  $default_board      = 'default.json',
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
    logstash    => $logstash_logging,
  }

  if $default_board != 'default.json' {
    file { '/var/www/html/kibana/dashboards/default.json':
      ensure  => link,
      target  => "/var/www/html/kibana/dashboards/${default_board}",
      force   => true,
    }
  }

}
