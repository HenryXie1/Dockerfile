#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*
# copy config files from k8s configmap
cp /mnt/k8s/*.conf /etc/httpd/conf/
exec /usr/sbin/apachectl -DFOREGROUND
