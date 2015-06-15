class appdynamics::install {

  file { "controller_info":
    path    => "$appdynamics::install_location/conf/controller-info.xml",
    ensure  => file,
    content => template('appdynamics/controller-info.xml.erb'
  }
}
