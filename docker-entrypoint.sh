#!/bin/sh

echo "\tUser: proxy\n\tPassword: ${PROXY_PASSWORD:-proxy}\n"
echo "proxy:${PROXY_PASSWORD:-proxy}" | chpasswd

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf --nodaemon
