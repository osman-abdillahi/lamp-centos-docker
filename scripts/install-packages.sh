#!/bin/bash

echo 'Download MySQL 5.7'
wget http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
echo '-------------------------------------------------------------------'

echo 'Add MySQL CE to rpm'
rpm -ivh mysql57-community-release-el6-7.noarch.rpm
echo '-------------------------------------------------------------------'


echo 'Install MySQL CE client and server'
yum install -y mysql-community-client mysql-community-server

