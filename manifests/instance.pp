define rhews::instance (
  $service_user,
  $connector_port,
  $connector_port_ssl,
  $ssl_certificate_file,
  $ssl_chain_file,
  $ssl_key_file,
  $java_home,
  $java_opts
  ) {

  include rhews::packages

  Class['rhews'] -> Class['rhews::packages']

  file { "/etc/sysconfig/${name}":
    ensure => file,
    content => template("${module_name}/sysconfig.erb"),
    owner => 'root',
    group => 'root',
    mode => '0644',
    notify => Rhews::Service["${name}"]
  }

  file { "/etc/init.d/${name}":
    ensure => link,
    target => '/etc/init.d/tomcat7',
    owner => 'root',
    group => 'root'
  }

  file { "/etc/${name}":
    ensure => directory,
    source => [ "puppet:///modules/${name}/conf",
                "puppet:///modules/${module_name}/tomcat7_conf" ],
    sourceselect => all,
    recurse => true,
    replace => false,
    owner => 'root',
    group => 'tomcat',
    mode => '0750'
  }

  file { "/etc/${name}/server.xml":
    ensure => file,
    owner => 'root',
    group => 'tomcat',
    mode => '0750',
    replace => true,
    content => template("${module_name}/server.xml.erb"),
    require => File["/etc/${name}"]
  }

  file { "/var/lib/${name}":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '2750'
  }

  file { "/var/lib/${name}/webapps":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '2750'
  }

  file { "/usr/share/${name}":
    ensure => directory,
    owner => 'root',
    group => 'tomcat',
    mode => '0750'
  }

  file { "/var/cache/${name}":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '0750'
  }

  file { "/usr/share/${name}/webapps":
    ensure => link,
    target => "/var/lib/${name}/webapps",
    owner => 'root',
    group => 'root'
  }

  file { "/usr/share/${name}/conf":
    ensure => link,
    target => "/etc/${name}",
    owner => 'root',
    group => 'root'
  }

  file { "/usr/share/${name}/bin":
    ensure => link,
    target => "/usr/share/tomcat7/bin",
    owner => 'root',
    group => 'root'
  }

  file { "/usr/share/${name}/lib":
    ensure => link,
    target => "/usr/share/java/tomcat7",
    owner => 'root',
    group => 'root'
  }

  file { "/var/log/${name}":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '0750'
  }

  file { "/usr/share/${name}/logs":
    ensure => link,
    target => "/var/log/${name}",
    owner => 'root',
    group => 'root'
  }

  file { "/var/cache/${name}/work":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '0750'
  }

  file { "/usr/share/${name}/work":
    ensure => link,
    target => "/var/cache/${name}/work",
    owner => 'root',
    group => 'root'
  }

  file { "/var/cache/${name}/temp":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '0750'
  }

  file { "/usr/share/${name}/temp":
    ensure => link,
    target => "/var/cache/${name}/temp",
    owner => 'root',
    group => 'root'
  }

  }
