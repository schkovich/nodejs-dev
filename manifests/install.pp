class nodejs_dev::install ($manage_repo = true, $user) {

  class {nodejs_dev::install::mongodb => $manage_repo }

}
