# == Class: kibana::service
#
# This class manages the kibana service
#
#
class kibana::service {

  $service_provider = $::kibana::params::service_provider ? {
    'init'  => undef,
    default => $::kibana::params::service_provider,
  }

  service { 'kibana':
    ensure   => running,
    enable   => true,
    require  => File['kibana-init-script'],
    provider => $service_provider,
  }
}
