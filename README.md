#puppet-appdynamics

####Table of Contents

1. [Overview] (#overview)
3. [Setup and Usage- How to use this module] (#setup)
4. [Reference - An under-the-hood peek at what the modules is doing and how] (#reference)
2. [Limitations - OS compatibility etc.] (#limitations)
5. [Development - Guide for contributing to the module] (#development)

##Overview

This module installs and configures the AppDynamics MachineAgent.  It can also install .zip Monitor Extensions.

##Setup and Usage

This module requires you to upload the MachineAgent zip file to a URL that your puppet clients can access.

```source_url``` defines the location of the MachineAgent zip file, it is expected to be of the form ```MachineAgent-4.0.7.0.zip``` or whatever the specified versions are.

Download the files from https://download.appdynamics.com

Install MachineAgent and configure with Hiera.

Add to your manifest
```
include ::appdynamics
```

Add to Hiera
```
appdynamics::source_url: 'https://mydomain.com/appdynamics'
appdynamics::version: '4.0.7.0'
appdynamics::install_location: '/opt/appdynamics_agent'
appdynamics::controller_host: 'myorg123.saas.appdynamics.com'
appdynamics::controller_port: '443'
appdynamics::controller_ssl_enabled: 'true'
appdynamics::account_name: 'MyOrg123'
appdynamics::account_access_key: 'xxxxx'
appdynamics::application_name: 'My App'
appdynamics::tier_name: 'My Tier'
appdynamics::service_ensure: 'running'
appdynamics::service_enable: 'true'
```

To install a monitor extension you need to upload the .zip file to a URL that your puppet clients can access, then create a `monitors` Hiera Hash to define the URL and name of the .zip file.  Note that the Name of each Hash should match the directory of the extracted zip file ie. `CassandraMonitor`.
```
appdynamics::monitors:
  CassandraMonitor:
    source_url: 'https://s3-eu-west-1.amazonaws.com/cakesolutions-public-downloads'
    zip_file: 'CassandraMonitor.zip'
```


##Reference

###Classes

* appdynamics: The main class to use, calls the others.
* appdynamics::install: Downloads the zip file and extracts into specified location.
* appdynamics::config: Configures the relevant config files.
* appdynamics::service: Manages the service is running.

###Parameters

**The following parameters are available in the `::appdynamics` class:**

####`version`

Defines the version of the MachineAgent that we want to install.

####`source_url`

The URL where the MachineAgent zip file is located.

####`install_location`

The local directory where the zip file will be stored and extracted.

####`controller_host`

The host name or IP address of the controller.

####`controller_port`

The port number of the controller.

####`controller_ssl_enabled`

Boolean value. `true` or `false`.

####`account_name`

AppDynamics Account name.

####`account_access_key`

AppDynamics Access Key.

####`service_ensure`

Should the MachineAgent be `running` or `stopped`.

####`service_enable`

Boolean - Should the MachineAgent service be enabled on boot `true` or `false`.

####`java_opts`

Java options that will be applied to the MachineAgent process, useful if you want to increase the maximum number of metrics.  `-Dappdynamics.agent.maxMetrics=10000`

####`application_name`

The AppDynamics Application Name under which to register the host.

####`tier_name`

The AppDynamics Tier under which to register the host.

####`node_name`

The name under which the node will be announced to AppDynamics.  Defaults to `$::fqdn`.

####`monitors`

A hash to define the extension monitors that you want to install.

##Limitations

Tested on RHEL 6.x only.  Probably works on CentOS 6.x too.

##Development

This module is a work in progress, community input to help with adding features, refactoring, adding tests and making compatible with various platforms are very welcome.

Please feel free to fork this repo and create a PR with your work.
