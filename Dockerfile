FROM httpd:2.4-alpine

ENV APACHE_LOG_DIR=/usr/local/apache2/logs
ENV APACHE_RUN_DIR=/usr/local/apache2/bin
ENV PS1 '\u@\h:\w\$'

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY entrypoint.sh /usr/local/bin/entrypoint
COPY vhost.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["httpd-foreground"]
