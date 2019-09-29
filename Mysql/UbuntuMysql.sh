#! /bin/bash

sudo su
apt-get update
apt-get  install -y mysql-server
mysql_secure_installation