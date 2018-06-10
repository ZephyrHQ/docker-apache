FROM httpd:2.4-alpine

ENV APACHE_LOG_DIR=/usr/local/apache2/logs
ENV APACHE_RUN_DIR=/usr/local/apache2/bin
ENV PS1 '\u@\h:\w\$'

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY localhost.key.pem /etc/ssl/key.pem
COPY localhost.cert.pem /etc/ssl/cert.pem
COPY entrypoint.sh /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["httpd-foreground"]
