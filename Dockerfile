FROM centos:6.7

# Install php
RUN yum install php php-mysql

# Install Apache
RUN yum install httpd

# Install MySQL server
RUN yum install mysql-server

# Remove php.info file and set Apache and MySQL to start on boot
RUN rm /var/www/html/info.php
RUN chkconfig httpd on
RUN chkconfig mysqld on

# Expose Apache, SSH, and MySQL ports
EXPOSE 22 25 80 443 3306

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]