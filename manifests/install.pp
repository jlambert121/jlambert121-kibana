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
  $group               = $::kibana::group,
  $user                = $::kibana::user,
) {

  $filename = $::architecture ? {
    /(i386|x86$)/    => "kibana-${version}-linux-x86",
    /(amd64|x86_64)/ => "kibana-${version}-linux-x64",
  }

  $service_provider = $::kibana::params::service_provider
  $run_path         = $::kibana::params::run_path

  group { $group:
    ensure => 'present',
    system => true,
  }

  user { $user:
    ensure  => 'present',
    system  => true,
    gid     => $group,
    home    => $install_path,
    require => Group[$group],
  }

  wget::fetch { 'kibana':
    source      => "${base_url}/${filename}.tar.gz",
    destination => "${tmp_dir}/${filename}.tar.gz",
    require     => User[$user],
  }

  exec { 'extract_kibana':
    command => "tar -xzf ${tmp_dir}/${filename}.tar.gz -C ${install_path}",
    path    => ['/bin', '/sbin'],
    creates => "${install_path}/${filename}",
    notify  => Exec['ensure_correct_permissions'],
    require => Wget::Fetch['kibana'],
  }

  exec { 'ensure_correct_permissions':
    command     => "chown -R ${user}:${group} ${install_path}/${filename}",
    path        => ['/bin', '/sbin'],
    refreshonly => true,
    require     => [
        Exec['extract_kibana'],
        User[$user],
    ],
  }

  file { "${install_path}/kibana":
    ensure  => 'link',
    target  => "${install_path}/${filename}",
    require => Exec['extract_kibana'],
  }

  file { '/var/log/kibana':
    ensure  => directory,
    owner   => kibana,
    group   => kibana,
    require => User['kibana'],
  }

  if $service_provider == 'init' {

    file { 'kibana-init-script':
      ensure  => file,
      path    => '/etc/init.d/kibana',
      content => template('kibana/kibana.legacy.service.lsbheader.erb', "kibana/${::kibana::params::init_script_osdependend}", 'kibana/kibana.legacy.service.maincontent.erb'),
      mode    => '0755',
      notify  => Class['::kibana::service'],
    }

  }

  if $service_provider == 'systemd' {

    file { 'kibana-init-script':
      ensure  => file,
      path    => '/usr/lib/systemd/system/kibana.service',
      content => template('kibana/kibana.service.erb'),
      notify  => Class['::kibana::service'],
    }
    
    file { 'kibana-run-dir':
      ensure => directory,
      path   => $run_path,
      owner  => $user,
      group  => $group,
      notify => Class['::kibana::service'],
    }

    file { 'kibana-tmpdir-d-conf':
      ensure  => file,
      path    => '/etc/tmpfiles.d/kibana.conf',
      owner   => root,
      group   => root,
      content => template('kibana/kibana.tmpfiles.d.conf.erb'),
    }
  }

}
