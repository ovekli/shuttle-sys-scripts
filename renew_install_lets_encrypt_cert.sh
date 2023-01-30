#!/bin/bash

certbotPemFile=/etc/letsencrypt/live/klinghed.se/fullchain.pem
certbotKeyFile=/etc/letsencrypt/live/klinghed.se/privkey.pem
nginxPemFile=/data/dockerVolumes/nginx-proxy/ssl/cert/star.klinghed.se.crt
nginxKeyFile=/data/dockerVolumes/nginx-proxy/ssl/key/star.klinghed.se.key

if certbot certonly --manual --preferred-challenges dns -d *.klinghed.se -d klinghed.se --force-renewal > /dev/null 2>&1; then
   cp $certbotPemFile $nginxPemFile
   cp $certbotKeyFile $nginxKeyFile
   docker restart nginx-proxy
fi   