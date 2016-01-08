FROM centos:7
MAINTAINER Joeri van Dooren

RUN yum -y install epel-release && yum -y install nginx && yum clean all -y

ADD nginx.conf
RUN chmod ugo+r /nginx.conf

RUN mkdir -p /var/www
RUN chmod -R ugo+r /var/www

# CONTENT HERE
echo 'Hello, World!' > /var/www/index.html

USER 997
EXPOSE 8080
CMD ["/usr/sbin/nginx", "-c", "/nginx.conf", "-g", "daemon off;"]
