FROM ubuntu:14.04
MAINTAINER Ashley Penney "apenney@metacloud.com"
RUN apt-get update

RUN apt-get install -y python-yaml python-jinja2 git
RUN git clone http://github.com/ansible/ansible.git /tmp/ansible
WORKDIR /tmp/ansible
ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin:/bin
ENV ANSIBLE_LIBRARY /tmp/ansible/library
ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH
RUN git clone http://github.com/apenney/ansible_zuul.git /tmp/zuul
ADD inventory /etc/ansible/hosts
WORKDIR /tmp/zuul
RUN ansible-playbook pre.yml -c local
# Remove this, consolidate into one role.
ADD source /var/zuul/application
RUN ansible-playbook post.yml -c local
#EXPOSE 80
