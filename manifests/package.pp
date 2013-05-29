# == Class: kibana::package
#
# This class installs kibana.  It should not be directly called.
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
class kibana::package (
  $ensure,
) {

  package { 'kibana':
    ensure  => $ensure,
  }

}
