# == Class: kibana::install
#
# This class installs kibana.  It should not be directly called.
#
#
# === Authors
#
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
class kibana::install (
  $version             = $::kibana::version,
  $base_url            = $::kibana::base_url,
  $tmp_dir             = $::kibana::tmp_dir,
  $install_path        = $::kibana::install_path,
  $legacy_service_mode = $::kibana::legacy_service_mode,
) {

  $filename = "kibana-${version}-linux-x64"

  group { 'kibana':
    ensure => 'present',
    system => true,
  }

  user { 'kibana':
    ensure  => 'present',
    system  => true,
    gid     => 'kibana',
    home    => $install_path,
    require => Group['kibana'],
  }

  wget::fetch { 'kibana':
    source      => "${base_url}/${filename}.tar.gz",
    destination => "${tmp_dir}/${filename}.tar.gz",
  }

  exec { 'extract_kibana':
    command => "tar -xzf ${tmp_dir}/${filename}.tar.gz -C ${install_path}",
    path    => ['/bin', '/sbin'],
    creates => "${install_path}/${filename}",
    require => Wget::Fetch['kibana'],
  }

  file { "${install_path}/kibana":
    ensure  => 'link',
    target  => "${install_path}/${filename}",
    require => Exec['extract_kibana'],
  }

  if $legacy_service_mode {
    file { '/etc/init.d/kibana':
      ensure  => 'file',
      content => template('kibana/kibana.legacy.service.erb'),
      mode    => 0755,
    }
  } else {
    file { '/usr/lib/systemd/system/kibana.service':
      ensure  => 'file',
      content => template('kibana/kibana.service.erb'),
    }
  }

  file { '/var/log/kibana':
    ensure  => directory,
    owner   => kibana,
    group   => kibana,
    require => User['kibana'],
  }

}
