#!/bin/bash

echo '-----------------------------------------------------------'
echo 'Starting Apache. Will display Apache access logs afterwards'
echo '-----------------------------------------------------------'

echo 'To kill the Dameon enter Ctrl + C. To keep Dameon runnig then enter Ctrl + Q + P'

service httpd24-httpd start
tail -f /opt/rh/httpd24/root/var/log/httpd/access_log
