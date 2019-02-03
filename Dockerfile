FROM 78392/osman-repo:centos6.5

# Install Apache 2.4 and PHP 5.6
RUN cd /etc/yum.repos.d/ && wget http://repos.fedorapeople.org/repos/jkaluza/httpd24/epel-httpd24.repo
RUN yum update && yum -y install httpd24.x86_64 \
	php56w 

# Export Apache 2.4 sbin directory to path
RUN export PATH="$PATH:/opt/rh/httpd24/root/usr/sbin"

# Ports exposed for Apache
EXPOSE 80,443
 
CMD service httpd24-httpd start
