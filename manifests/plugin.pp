#
# == Define kibana::plugin
#
#  Defined type to manage kibana plugins
#
define kibana::plugin(
  $source,
  $ensure       = 'present',
  $url          = undef,
  $install_root = $::kibana::install_path,
  $group        = $::kibana::group,
  $user         = $::kibana::user) {

  if $url {
    $base_module_name = $name
    $install_cmd      = "kibana plugin --install ${source} --url ${url}"
  } else {
    # plugins must be formatted <org>/<plugin>/<version>
    $filenameArray    = split($source, '/')
    $base_module_name = $filenameArray[-2]
    $install_cmd      = "kibana plugin --install ${source}"
  }

  # borrowed heavily from https://github.com/elastic/puppet-elasticsearch/blob/master/manifests/plugin.pp
  $plugins_dir   = "${install_root}/kibana/installedPlugins"
  $uninstall_cmd = "kibana plugin --remove ${base_module_name}"

  Exec {
    path      => [ '/bin', '/usr/bin', '/usr/sbin', "${install_root}/kibana/bin" ],
    cwd       => '/',
    user      => $user,
    tries     => 6,
    try_sleep => 10,
    timeout   => 600,
  }

  case $ensure {
    'installed', 'present': {
      $name_file_path = "${plugins_dir}/${base_module_name}/.name"
      exec {"install_plugin_${base_module_name}":
        command => $install_cmd,
        creates => $name_file_path,
        notify  => Service['kibana'],
        require => File[$plugins_dir],
      }
      file {$name_file_path:
        ensure  => file,
        content => $base_module_name,
        require => Exec["install_plugin_${base_module_name}"],
      }
    }
    'absent': {
      exec {"remove_plugin_${base_module_name}":
        command => $uninstall_cmd,
        onlyif  => "test -f ${name_file_path}",
        notify  => Service['kibana'],
      }
    }
    default: {
      fail("${ensure} is not a valid ensure command.")
    }
  }
}
