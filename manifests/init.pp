# Class: nodejs_dev
#
# This module manages nodejs_dev
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nodejs_dev (
  $host = $nodejs_dev::conf::host, $port = 8080, $user = 'vagrant'
) inherits nodejs_dev::conf {

  class {"nodejs_dev::user":}

  package {"git":
    ensure => "installed",
    provider => "apt",
    require => Class['nodejs_dev::user']
  }

  file {
    "/home/${user}/opt":
    ensure => directory,
    group  => $user,
    owner  => $user,
    mode   => 0755,
    require => Package["git"],
  }

  class {'nodejs_dev::nodejs_install':
    user => $user,
    subsribe => File["/home/${user}/opt"],
  }

  class {'nodejs_dev::redis_install':
    require => Class['nodejs_dev::nodejs_install'],
  }
}

