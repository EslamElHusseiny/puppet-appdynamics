define appdynamics::resources::install_monitor (
  $source_url,
  $zip_file,
  $extracted_dir = $title
) {

  include ::wget

  wget::fetch { "monitor_$title":
    source      => "$source_url/$zip_file",
    destination => "/var/tmp/$zip_file"
  }
  ->
  exec { "extract_$title":
    cwd     => "/var/tmp",
    command => "/usr/bin/unzip $zip_file -d $appdynamics::install_location/monitors/",
    creates => "$appdynamics::install_location/monitors/$extracted_dir",
    before  => Class['appdynamics::service']
  }
}
