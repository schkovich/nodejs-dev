class nodejs_dev::nodejs_install ($manage_repo = true) {
  validate_bool($manage_repo)

  class { 'nodejs': manage_repo => $manage_repo }
}
