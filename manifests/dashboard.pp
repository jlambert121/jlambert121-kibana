# == Define: kibana::dashboard
#
# Install a custom kibana dashboard
#
#
# === Parameters
# [*siyrce*]
#   String.  Location to install the dashboard from
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
define kibana::dashboard (
  $source,
) {

  validate_re($name, '\.json$', 'Dashboard name needs to end in .json')

  file { "/var/www/html/kibana/dashboards/${name}":
    ensure  => file,
    mode    => '0444',
    source  => $source,
  }
}
