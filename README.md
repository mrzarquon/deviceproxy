Simple module to deploy ssl certificates for use with a proxy

The deviceproxy module takes three params, those are the fqdn's of the devices you want to manage

On the master, pregenerate those certificates by running the command
/opt/puppet/bin/puppet cert generate $devicefqdn

for each devicefqdn

Assign this class to the node that will be acting as the proxy.

Configure your device.conf file with the credentials and matching certificate names to the three generated here
