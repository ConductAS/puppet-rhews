# == Class: puppet-rhews
#
#
# === Parameters
#
# None, parameters are given to defined instances. See puppet-rhews::instance.
#
# === Examples
#
#
# === Authors
#
# Bjørn Ola Smievoll <bos@conduct.no>
#
# === Copyright
#
# Copyright 2013 Conduct AS, unless otherwise noted.
#

class puppet-rhews {
  
  include puppet-rhews::packages

  Class['puppet-rhews'] -> Class['puppet-rhews::packages']
}
