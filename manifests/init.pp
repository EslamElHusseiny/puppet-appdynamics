class appdynamics (
  $source_url,
  $version,
  $install_location,
  $controller_host,
  $controller_port,
  $controller_ssl_enabled,
  $account_name,
  $account_access_key,
  $service_ensure = running,
  $service_enable = true,
  $java_opts = '',
  $application_name = '',
  $tier_name = '',
  $node_name = $::fqdn,
  $monitors = {}
) {

  include appdynamics::install
  include appdynamics::config
  include appdynamics::service

  create_resources ('appdynamics::resources::install_monitor', $monitors)

  Class['appdynamics::install'] ->
  Class['appdynamics::config'] ->
  Class['appdynamics::service']

}
