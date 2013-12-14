class nodejs_dev::nodejs_install ($manage_repo = true, $user) {
  validate_bool($manage_repo)

  class { 'nodejs': manage_repo => $manage_repo }

  nodejs::npm { "/home/${user}/opt:git+https://github.com/schkovich/tcpproxy.git":
    ensure  => present,
    require => Class['nodejs'],
  }
}
