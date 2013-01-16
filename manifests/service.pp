define rhews::service (
  $service_name
  ) {

  service {
    "tomcat-${service_name}":
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      start => "service tomcat-${service_name} start",
      stop => "service tomcat-${service_name} stop",
      status => "service tomcat-${service_name} status",
      restart => "service tomcat-${service_name} restart",
      require => Class['rhews::instance'],
      subscribe => Class['rhews::instance']
  }
}
