class appdynamics::install {

  include ::wget

  $install_file = "MachineAgent-$appdynamics::version.zip"

  exec { 'create_install_dir':
    command => "/bin/mkdir -p $appdynamics::install_location",
    creates => "$appdynamics::install_location"
  }
  ->
  wget::fetch { 'machine_agent':
    source      => "$appdynamics::source_url/$install_file",
    destination => "$appdynamics::install_location/$install_file"
  }
  ->
  exec { 'extract_machine_agent':
    cwd     => $appdynamics::install_location,
    command => "/usr/bin/unzip $install_file",
    creates => "$appdynamics::install_location/machineagent.jar"
  }
}
