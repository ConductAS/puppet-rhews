define rhews::instance (
  $service_name,
  $service_user,
  $connector_port,
  $java_home,
  $java_opts
  ) {

  file { "/etc/sysconfig/tomcat-${service_name}":
    ensure => file,
    content => template('sysconfig.erb'),
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Class['rhews::install']
  }

  file { "/etc/init.d/tomcat-$service_name":
    ensure => link,
    target => '/etc/init.d/tomcat7',
    owner => 'root',
    group => 'root'
  }

  file { "/etc/tomcat-${service_name}":
    ensure => directory,
    source => 'puppet:///${module_name}/tomcat7_conf',
    recurse => true,
    replace => false,
    owner => 'root',
    group => 'tomcat',
    mode => '0750'
  }

  file { "/var/lib/tomcat-${service_name}":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '2750'
  }

  file { "/var/lib/tomcat-${service_name}/webapps":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '2750'
  }

  file { "/usr/share/tomcat-${service_name}/webapps":
    ensure => link,
    target => "/var/lib/tomcat-${service_name}/webapps",
    owner => 'root',
    group => 'root'
  }

  file { "/var/log/tomcat-${service_name}":
    ensure => directory,
    owner => "${service_user}",
    group => "${service_user}",
    mode => '0750'
  }

  file { "/usr/share/tomcat-${service_name}/logs":
    ensure => link,
    target => "/var/log/tomcat-${service_name}",
    owner => 'root',
    group => 'root'
  }

  file { "/usr/share/tomcat-${service_name}/bin":
    ensure => link,
    target => "/usr/share/tomcat7/bin",
    owner => 'root',
    group => 'root'
  }

  file { "/usr/share/tomcat-${service_name}/lib":
    ensure => link,
    target => "/usr/share/java/tomcat7",
    owner => 'root',
    group => 'root'
  }

  file { "/usr/share/tomcat-${service_name}/webapps":
    ensure => link,
    target => "/usr/share/tomcat7",
    owner => 'root',
    group => 'root'
  }

  file { "/var/cache/tomcat-${service_name}/work":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '0750'
  }

  file { "/usr/share/tomcat-${service_name}/work":
    ensure => link,
    target => "/var/cache/tomcat-${service-name}/work",
    owner => 'root',
    group => 'root'
  }

  file { "/var/cache/tomcat-${service_name}/temp":
    ensure => directory,
    owner => "${service_user}",
    group => 'tomcat',
    mode => '0750'
  }

  file { "/usr/share/tomcat-${service_name}/temp":
    ensure => link,
    target => "/var/cache/tomcat-${service-name}/temp",
    owner => 'root',
    group => 'root'
  }

  }
