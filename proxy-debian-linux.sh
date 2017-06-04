#!/bin/bash
#
# Debian
#

set -v

apt-get -y update

apt-get install -y ntpdate
apt-get install -y squid3 apache2-utils

cp /etc/squid3/squid.conf /etc/squid3/squid.conf.bak

cat << EOF > /etc/squid3/squid.conf
http_port 80
http_access allow all
cache deny all
forwarded_for delete
request_header_access Via deny all
EOF

/etc/init.d/squid3 restart

echo "IP ADDRESS"

curl ifconfig.co

#Be sure to shutdown/terminate your VM after you are done!