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
) inherits nodejs_dev::conf {

  class {"nodejs_dev::user": }
  ->
  class { 'nodejs':
    repo_url_suffix => '6.x',
    nodejs_dev_package_ensure => 'absent',
    npm_package_ensure        => 'absent',
  }

}
