#!/bin/bash

sudo apt-get update
sudo apt-get install build-essential python-pip python-m2crypto python-dev python-gevent supervisor -y
sudo pip install shadowsocks

sudo echo "
{
    "\""server"\"":"\""1.1.1.1"\"",
    "\""port_password"\"":{
        "\""8388"\"":"\""password"\""
    },
    "\""timeout"\"":600,
    "\""method"\"":"\""aes-256-cfb"\""
}" >  /etc/shadowsocks.json

sudo echo "[program:shadowsocks]
command=ssserver -c /etc/shadowsocks.json
autorestart=true
user= nobody" > /etc/supervisor/conf.d/shadowsocks.conf

sudo service supervisor start
sudo supervisorctl reload
