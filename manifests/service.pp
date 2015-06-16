class appdynamics::service {

  file { "/etc/init.d/appd_machineagent":
    ensure => file,
    mode   => 755,
    owner  => root,
    group  => root,
    source => "puppet:///modules/appdynamics/appd_machineagent"
  }
  ->
  service { "appd_machineagent":
    ensure => "$appdynamics::service_ensure",
    enable => "$appdynamics::service_enable",
    status => "pgrep -f machineagent.jar"
  }
}
