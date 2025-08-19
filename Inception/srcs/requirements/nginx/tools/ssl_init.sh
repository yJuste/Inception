#!/bin/bash

sed -e "s|{SSL_CRT}|${SSL_CRT}|g" \
    -e "s|{SSL_KEY}|${SSL_KEY}|g" \
    -e "s|{DOMAIN_NAME}|${DOMAIN_NAME}|g" \
    /etc/nginx/nginx.template > /etc/nginx/nginx.conf

# Creating a self-signed certificate, without a password
if [ ! -f ${SSL_CRT} ];
then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out ${SSL_CRT} \
    -keyout ${SSL_KEY} \
    -subj "/C=${SSL_COUNTRY}/ST=${SSL_STATE}/L=${SSL_LOCALITY}/O=${SSL_ORGANIZATION}/OU=${SSL_ORGANIZATION_UNIT}/CN=${DOMAIN_NAME}/UID=${SSL_USER_ID}";
fi

exec "$@"
