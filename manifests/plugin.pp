#
# == Define kibana::plugin
#
#  Defined type to manage kibana plugins
#
define kibana::plugin(
  $source,
  $ensure       = 'present',
  $install_root = $::kibana::install_path,
  $group        = $::kibana::group,
  $user         = $::kibana::user) {

  # plugins must be formatted <org>/<plugin>/<version>
  $filenameArray = split($source, '/')
  $base_module_name = $filenameArray[-2]

  # borrowed heavily from https://github.com/elastic/puppet-elasticsearch/blob/master/manifests/plugin.pp
  $plugins_dir = "${install_root}/kibana/installedPlugins"
  $install_cmd = "kibana plugin --install ${source}"
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
      exec {"install_plugin_${name}":
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
