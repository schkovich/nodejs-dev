class nodejs_dev::install ($manage_repo = false, $user) {

  class { '::nodejs':
    manage_package_repo       => $manage_repo,
    nodejs_dev_package_ensure => 'present',
  }
}
