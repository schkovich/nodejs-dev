class nodejs_dev::conf {

  if $ec2_local_ipv4 == "UNDEF" {
    #    http://docs.puppetlabs.com/facter/1.6/core_facts.html#ipaddressnetwork-interface
    $host = $ipaddress_lo
  } else {
    #    Public IP address if launched with direct addressing; private IP address if launched with public addressing.
    #    http://docs.aws.amazon.com/AWSEC2/2008-05-05/DeveloperGuide/index.html?AESDG-chapter-instancedata.html
    #    http://support.rightscale.com/09-Clouds/AWS/02-Amazon_EC2/EC2_Meta-data
    $host = $ec2_local_ipv4
  }
#  $port = hiera("node_js::port")
#  $key = hiera("node_js::key")
#  $cert = hiera("node_js::cert")
#  $ca = hiera("node_js::ca")
#  $memcache = hiera("node_js::memcache")
#  $admin_namespace = hiera("node_js::admin_namespace")
}

