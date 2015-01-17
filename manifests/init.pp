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
  $host = $nodejs_dev::conf::host,
  $port = 8080,
  $user = 'vagrant',
  $install_dir = ''
) inherits nodejs_dev::conf {

  case $install_dir {'': { $install_dir = "/home/${user}/opt" } }
  ->
  class {"nodejs_dev::user": }

  file {
    "${install_dir}":
    ensure => directory,
    group  => $user,
    owner  => $user,
    mode   => 0755,
    require => Class["nodejs_dev::user"],
  }

  class {'nodejs_dev::install':
    user => $user,
    subscribe => File["${install_dir}"],
  }
}

