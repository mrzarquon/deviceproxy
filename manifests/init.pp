class deviceproxy (
  $devfqdn = "mydevice.domain.name",
  $devfqdn2 = "mydevice2.domain.name",
  $devfqdn3 = "mydevice3.domain.name",
) {

  # prior to running this code
  # on the master execute '/opt/puppet/bin/puppet cert generate mydevice.domain.name'

  File {
    owner => 'pe-puppet',
    group => 'pe-puppet',
  }

  file { '/var/opt/lib/pe-puppet/devices':
    ensure => directory,
    mode   => '0750'
  }

  deviceproxy::certs { [$devfqdn, $devfqdn2, $devfqdn3 ]:
    require => File['/var/opt/lib/pe-puppet/devices'],
  }

}
