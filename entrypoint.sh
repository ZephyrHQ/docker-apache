#!/bin/bash
set -e

[ -f "/var/run/apache2/apache2.pid" ] && rm /var/run/apache2/apache2.pid

echo "Déplacement des fichiers de configuration"
[ -f /conf/vhost.conf ] && cp /conf/vhost.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
[ -f /conf/cert.pem ] && cp /conf/cert.pem /etc/ssl/cert.pem
[ -f /conf/key.pem ] && cp /conf/key.pem /etc/ssl/key.pem

cd ~

echo exec "$@"
exec "$@"
