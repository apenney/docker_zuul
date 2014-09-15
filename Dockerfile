FROM ubuntu:14.04
MAINTAINER Ashley Penney "apenney@metacloud.com"
RUN apt-get update
RUN apt-get install -y python-dev python-virtualenv git
RUN mkdir -p /var/zuul
RUN virtualenv /var/zuul/virtualenv
RUN git clone https://github.com/openstack-infra/zuul.git /var/zuul/application
RUN /var/zuul/virtualenv/bin/pip install -r /var/zuul/application/requirements.txt
#EXPOSE 80
