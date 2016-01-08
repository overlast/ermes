#!/usr/bin/env bash

#set -x # show executed commands
set -e # die when an error will occur

BASEDIR=`cd $(dirname $0); pwd`                                                                                                                                       USER_ID=`/usr/bin/id -u`
ECHO_PREFIX="[install-nginx-to-local] :"

echo "${ECHO_PREFIX} Start !!"

echo "${ECHO_PREFIX} cd ./tmp"
if [ ! -d ${BASEDIR}/../tmp ]; then
    mkdir tmp
fi
cd ${BASEDIR}/../tmp

echo "${ECHO_PREFIX} git clone nginx-msgpack-rpc-module"
if [ -d ./nginx-msgpack-rpc-module ]; then
    rm -rf ./nginx-msgpack-rpc-module
fi
git clone https://github.com/overlast/nginx-msgpack-rpc-module.git

NGINX_GW=${BASEDIR}/../nginx/nginx-ermes-web

echo "${ECHO_PREFIX} install nginx with msgpack-rpc-module to ${NGINX_GW}"
cd ./nginx-msgpack-rpc-module
./sh/make_sample_nginx_with_msgpack_rpc_module_dir.sh -y -p ${NGINX_GW} -u

echo "${ECHO_PREFIX} Finish !!"
