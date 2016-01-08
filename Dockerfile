FROM centos:7
MAINTAINER Joeri van Dooren

RUN yum -y install epel-release && yum -y install nginx && yum clean all -y

RUN mkdir -p /var/www
RUN chmod -R ugo+r /var/www

# CONTENT HERE
RUN echo 'Hello, World!' > /var/www/index.html

ADD nginx.conf /
RUN chmod ugo+r /nginx.conf

USER 997
EXPOSE 8080
CMD ["/usr/sbin/nginx", "-c", "/nginx.conf", "-g", "daemon off;"]

LABEL io.openshift.expose-services 8080/tcp:http
LABEL io.openshift.min-memory 1Gi
LABEL io.openshift.min-cpu     1
LABEL io.k8s.description nginx static web server
LABEL io.openshift.non-scalable     false
LABEL io.openshift.host.generated	  true
