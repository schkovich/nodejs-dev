class nodejs_dev::install::mongodb (
  $manage_repo = true,
  $port = 27018,
  $dbname = undef,
  $dbuser = undef,
  $password = undef,
  $dbadmin = undef,
  $admin_password = undef
  ) {

  validate_bool($manage_repo)

  class {'::mongodb::globals':
    manage_package_repo => $manage_repo,
  }
  ->
  class {'::mongodb::server':
    port    => $port,
    verbose => true,
  }
  ->
  class {'::mongodb::client':}
  ->
  mongodb_database { "${dbname}":
    ensure   => present,
  }
  ->
  mongodb_user { admin:
    username      => $dbadmin,
    ensure        => present,
    password_hash => mongodb_password($dbadmin, $admin_password),
    database      => "${dbname}",
    roles         => ['dbOwner'],
  }
  ->
  mongodb_user { vatuser:
    username      => $dbuser,
    ensure        => present,
    password_hash => mongodb_password($dbuser, $password),
    database      => "${dbname}",
    roles         => ['readWrite'],
  }

}
