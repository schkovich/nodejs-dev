class nodejs_dev::redis_install ($manage_repo = true) {
  validate_bool($manage_repo)

  class { 'redis': manage_repo => $manage_repo }
}
