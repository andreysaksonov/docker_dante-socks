#!/bin/sh

echo "proxy:${PROXY_USER_PASSWORD:-proxy}" | chpasswd

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf --nodaemon
