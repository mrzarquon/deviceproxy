define deviceproxy::certs (
  $devfqdn = $title
) {


  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}":
    ensure => directory,
    mode   => '0755',
  }

  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}/ssl":
    ensure => directory,
    owner  => '0771',
  }

  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}/ssl/private_keys":
    ensure => directory,
    owner  => '0771',
  }

  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}/ssl/certs":
    ensure => directory,
    owner  => '0771',
  }

  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}/ssl/private_keys/${devfqdn}.pem":
    ensure  => file,
    mode    => '0600',
    content => file("/etc/puppetlabs/puppet/ssl/private_keys/${devfqdn}.pem"),
  }

  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}/ssl/certs/ca.pem":
    ensure  => file,
    mode    => '0644',
    content => file("/etc/puppetlabs/puppet/ssl/certs/ca.pem"),
  }

  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}/ssl/certs/${devfqdn}.pem":
    ensure  => file,
    mode    => '0644',
    content => file("/etc/puppetlabs/puppet/ssl/certs/${devfqdn}.pem"),
  }

  file { "/var/opt/lib/pe-puppet/devices/${devfqdn}/ssl/crl.pem":
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/crl.pem"),
  }


}
