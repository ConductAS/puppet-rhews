define puppet-rhews::service {

  service {
    "tomcat-${name}":
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      start => "service tomcat-${name} start",
      stop => "service tomcat-${name} stop",
      status => "service tomcat-${name} status",
      restart => "service tomcat-${name} restart",
      require => Class['puppet-rhews::instance'],
      subscribe => Class['puppet-rhews::instance']
  }
}
