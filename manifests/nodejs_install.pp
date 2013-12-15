class nodejs_dev::nodejs_install ($manage_repo = true, $user) {

  class {'nodejs': manage_repo => $manage_repo }

  nodejs::npm { "/home/${user}/opt":
    source => "git+https://github.com/schkovich/tcpproxy.git",
    ensure  => present,
    require => Class['nodejs'],
  }
}
