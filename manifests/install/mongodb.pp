class nodejs_dev::install::mongodb ($manage_repo = true) {

  validate_bool($manage_repo)

  class {'::mongodb::globals':
    manage_package_repo => $manage_repo,
  }
  ->
  class {'::mongodb::server':
    port    => 27017,
    verbose => true,
  }
  ->
  class {'mongodb::client':}
  ->
  mongodb_database { 'vatdb':
    ensure   => present,
    tries    => 10,
  }
  ->
  mongodb_user { vatuser:
    username      => 'vateu',
    ensure        => present,
    password_hash => '6c59af3bd58968e1392a2210bce198a5',
  #    password_hash => mongodb_password('testuser', 'p@ssw0rd'),
    database      => 'vatdb',
    roles         => ['readWrite', 'dbAdmin'],
    tries         => 10,
  }

}
