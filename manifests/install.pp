class nodejs_dev::install ($manage_repo = true, $user) {

  class {'nodejs': manage_repo => $manage_repo }

}
