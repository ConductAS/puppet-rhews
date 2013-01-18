define puppet-rhews::service {

  Puppet-rhews::Instance["${name}"] -> Puppet-rhews::Service["${name}"]

  service {
    "${name}":
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      start => "service ${name} start",
      stop => "service ${name} stop",
      status => "service ${name} status",
      restart => "service ${name} restart",
      subscribe => Puppet-rhews::Instance["${name}"]
  }
}
