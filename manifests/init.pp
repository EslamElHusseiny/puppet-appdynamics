class appdynamics (
  $source_url,
  $version,
  $install_location,
  $controller_host,
  $controller_port,
  $controller_ssl_enabled,
  $account_name,
  $account_access_key
) {

  include appdynamics::install
  include appdynamics::config

}
