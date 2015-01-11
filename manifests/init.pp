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

  class {"nodejs_dev::user": }

  file {
    "/home/${user}/opt":
    ensure => directory,
    group  => $user,
    owner  => $user,
    mode   => 0755,
    require => Class["nodejs_dev::user"],
  }

  class {'nodejs_dev::install':
    user => $user,
    subscribe => File["/home/${user}/opt"],
  }
}

