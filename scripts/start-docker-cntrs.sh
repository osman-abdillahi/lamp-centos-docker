#!/bin/bash

# Taken from https://code.i-harness.com/en/q/4c8468
function parse_yaml {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

function stop_docker_container() {
  while [ "$(docker inspect --format="{{.State.Running}}" $1 2> /dev/null)" == "true" ]
  do
    echo "$1 is running. Will stop and remove"
    docker stop $1 && docker rm $1
  done
}

# Parse config file
eval $(parse_yaml ../conf/config.yaml)

stop_docker_container "$nodes_web1_name"

echo '-----------------------------------------------------------'
echo 'Start Web1 centOS container'
echo '-----------------------------------------------------------'

nohup docker run -v /opt/web1/conf:/opt/rh/httpd24/root/etc/httpd/conf \
	-v /opt/web1/site:/opt/rh/httpd24/root/var/www/html \
	-p $nodes_web1_port:80 --name $nodes_web1_name 78392/centos-php-apache:cap-0.3 &>/dev/null &

sleep 10s

stop_docker_container "$nodes_web2_name"

echo '-----------------------------------------------------------'
echo 'Start Web2 centOS container'
echo '-----------------------------------------------------------'
nohup docker run -v /opt/web2/conf:/opt/rh/httpd24/root/etc/httpd/conf \
        -v /opt/web2/site:/opt/rh/httpd24/root/var/www/html \
        -p $nodes_web2_port:80 --name $nodes_web2_name 78392/centos-php-apache:cap-0.3 &>/dev/null &
sleep 10s
