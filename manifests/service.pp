class appdynamics::service {

  service { "appd_machineagent":
    ensure => "$appdynamics::service_ensure",
    enable => "$appdynamics::service_enable",
  }
}
