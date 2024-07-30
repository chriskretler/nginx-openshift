#!/bin/bash

# Modify the UID of www-data if the container's UID is >= 1000
if [ "$(id -u)" -ge 1000 ] ; then
    sed -e "/^nginx:/c nginx:x:$(id -u):$(id -g):nginx:/var/www:/usr/sbin/nologin" /etc/passwd > /tmp/passwd
    cat /tmp/passwd > /etc/passwd
    rm /tmp/passwd
fi

# Execute CMD
exec "$@"