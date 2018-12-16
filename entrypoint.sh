#!/bin/bash
set -e

[ -f "/var/run/apache2/apache2.pid" ] && rm /var/run/apache2/apache2.pid

echo "Déplacement des fichiers de configuration"
[ -f /conf/httpd.conf ] && echo copy httpd.conf && cp /conf/httpd.conf /usr/local/apache2/conf/httpd.conf
[ -f /conf/vhost.conf ] && echo copy vhost.conf && cp /conf/vhost.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

cd ~

echo exec "$@"
exec "$@"
