class rhews::packages {

  package { 'tomcat7':
    ensure => installed,
    require => [ Package['java-1.7.0-openjdk-devel'] ]
  }

  package { 'tomcat-native':
    ensure => installed,
    require => [ Package['tomcat7'] ]
  }

  package { 'java-1.7.0-openjdk-devel':
    ensure => installed
  }
}
