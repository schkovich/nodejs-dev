class nodejs_dev::mongodb_install ($manage_repo = true) {

  validate_bool($manage_repo)

  class {'::mongodb::globals':
    manage_package_repo => $manage_repo,
  }
  ->
  class {'::mongodb::server':
    auth => true,
  }
  ->
  ::mongodb::db { 'vatdb':
    user          => 'vateu',
    password_hash => '6c59af3bd58968e1392a2210bce198a5',
  }
  ->
  class {'::mongodb::client': }

}
