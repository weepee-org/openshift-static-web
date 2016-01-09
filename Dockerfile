FROM centos:7
MAINTAINER Joeri van Dooren

RUN yum -y install epel-release && yum -y install nginx && yum clean all -y

RUN mkdir -p /var/www

# web content
ADD html /var/www

RUN chmod -R ugo+r /var/www

ADD nginx.conf /

RUN chmod ugo+r /nginx.conf

USER 997
EXPOSE 8080
CMD ["/usr/sbin/nginx", "-c", "/nginx.conf", "-g", "daemon off;"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Platform for serving static HTML files" \
      io.k8s.display-name="nginx centos7 epel" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,html,nginx" \
      io.openshift.min-memory="1Gi" \
      io.openshift.min-cpu="1" \
      io.openshift.non-scalable="false"
