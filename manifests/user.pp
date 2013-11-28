class nodejs_dev::user (
  $runas = $nodejs_dev::user::conf::runas,
  $group = $nodejs_dev::user::conf::group,
  $membership = 'minimum') inherits nodejs_dev::user::conf {
  # Define user resource
  # todo: skip sss-certs if ssl is not enabled
  # Make sure that user www-data is present and that the user is member of
  # ssl-cert group
  # Members of ssl-cert group have read access to private keys in /etc/ssl
  @user { "$runas":
    ensure     => present,
    groups     => [$group],
    membership => $membership
  }

  group { $group: ensure => "present", system => true}

  User <| title == $runas |>
}

