define rhews::service {

  Rhews::Instance["${name}"] -> Rhews::Service["${name}"]

  service {
    "${name}":
      ensure => running,
      hasstatus => true,
      hasrestart => true,
      start => "service ${name} start",
      stop => "service ${name} stop",
      status => "service ${name} status",
      restart => "service ${name} restart",
      subscribe => Rhews::Instance["${name}"]
  }
}
