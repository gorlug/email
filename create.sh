#!/bin/bash
if [ -z "$1" ]
  then
    echo "you have to specify the host name"
    exit -1
fi
TLS_FOLDER="config/TLS"
if [ ! -e $TLS_FOLDER ]
then
    mkdir -p $TLS_FOLDER
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $TLS_FOLDER/ssl_private_key.pem -out $TLS_FOLDER/ssl_certificate.pem 
    cp $TLS_FOLDER/ssl_certificate.pem $TLS_FOLDER/cert.pem
    touch $TLS_FOLDER/chain.pem
fi
sh install
HOST=$1 docker-compose up -d
