FROM centos:6.7

# Install php 5.6. Need to add EPEL and Remi repository
RUN wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh epel-release-6-8.noarch.rpm remi-release-6.rpm

RUN yum install php php-mysql

# Install Apache
#RUN yum install httpd

# Install MySQL server
#RUN yum install mysql-server

# Remove php.info file and set Apache and MySQL to start on boot
#RUN rm /var/www/html/info.php
#RUN chkconfig httpd on
#RUN chkconfig mysqld on

# Expose Apache, SSH, and MySQL ports
#EXPOSE 22 25 80 443 3306