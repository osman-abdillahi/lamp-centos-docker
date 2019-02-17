FROM 78392/osman-repo:centos6.5

# Install Apache 2.4 and PHP 5.6
RUN cd /etc/yum.repos.d/ && wget http://repos.fedorapeople.org/repos/jkaluza/httpd24/epel-httpd24.repo
RUN yum update && yum -y install httpd24.x86_64 \
	php56w 

# Install MySQL 5.7
#RUN wget http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm && \
# rpm -ivh mysql57-community-release-el6-7.noarch.rpm && \
# yum install -y mysql-community-client mysql-community-server


# Export Apache 2.4 sbin directory to path
RUN export PATH="$PATH:/opt/rh/httpd24/root/usr/sbin" && mkdir /usr/local/gw

ADD /usr/local/gw/* /usr/local/gw/ 
ADD /usr/local/sbin/* /usr/local/sbin/
ADD scripts/start-services.sh .
ADD scripts/install-packages.sh .
ADD conf/httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/
ADD info.php /opt/rh/httpd24/root/var/www/html/
ADD libphp5.so /opt/rh/httpd24/root/etc/httpd/modules/

RUN ./install-packages.sh
CMD ["./start-services.sh"]
