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
