class appdynamics::service {

  file { "/etc/init.d/appd_machineagent":
    ensure => file,
    mode   => 755,
    owner  => root,
    group  => root,
    content => template('appdynamics/appd_machineagent.erb')
  }
  ->
  service { "appd_machineagent":
    ensure => "$appdynamics::service_ensure",
    enable => "$appdynamics::service_enable",
    status => "pgrep -f machineagent.jar"
  }
}
