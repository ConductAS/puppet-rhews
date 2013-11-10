# == Class: rhews
#
#
# === Parameters
#
# None, parameters are given to defined instances. See rhews::instance.
#
# === Examples
#
#
# === Authors
#
# Bjorn Ola Smievoll <bos@conduct.no>
#
# === Copyright
#
# Copyright 2013 Conduct AS, unless otherwise noted.
#

class rhews {
  
  include rhews::packages

  Class['rhews'] -> Class['rhews::packages']
}
