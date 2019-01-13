#!/bin/sh -
cp /etc/letsencrypt/live/{{ domain }}/chain.pem /etc/swanctl/x509ca/
cp /etc/letsencrypt/live/{{ domain }}/privkey.pem /etc/swanctl/private/
cp /etc/letsencrypt/live/{{ domain }}/fullchain.pem /etc/swanctl/x509/
/usr/sbin/swanctl --load-creds