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

  file {
    "${install_dir}":
    ensure => directory,
    group  => $user,
    owner  => $user,
    mode   => 0755,
  }

  class {"nodejs_dev::user":
    subscribe => File["${install_dir}"],
  }
  ->
  class { 'nodejs': }

}

