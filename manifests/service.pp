# == Class: kibana::service
#
# This class manages the kibana service
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class kibana::service {

  service { 'kibana':
    ensure   => running,
    enable   => true,
    require  => File['kibana-init-script'],
    provider => $::kibana::params::service_provider,
  }
}
