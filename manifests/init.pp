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
  $host = $nodejs_dev::conf::host, $port = 8080
) inherits nodejs_dev::conf {

  include nodejs_dev::user
  include nodejs_dev::nodejs_install
  include nodejs_dev::redis_install

  file {
    "/home/ubuntu/opt":
      ensure => directory,
      group  => "ubuntu",
      owner  => "ubuntu",
      mode   => 0755;
  }
}

