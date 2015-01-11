class nodejs_dev::install::redis ($manage_repo = true) {
  validate_bool($manage_repo)

  class { 'redis': manage_repo => $manage_repo }
}
