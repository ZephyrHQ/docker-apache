#!/bin/bash
CMD=$*

[ -f "/var/run/apache2/apache2.pid" ] && rm /var/run/apache2/apache2.pid

if [[ "$ENV" = "dev" ]]
then
    echo Dev environment activation
    sed -e s/app.php/app_dev.php/g /vhost.conf > /tmp/vhost.conf
    sed -i -e "s/app\\\.php/app_dev\\\.php/g" /tmp/vhost.conf 
    sed -i -e "s/#ServerName/ServerName dev.zephyr-web.eu/g" /tmp/vhost.conf
    cat /tmp/vhost.conf > /etc/apache2/sites-available/vhost.conf
fi

echo Start apache
$CMD
