#PostgreSQL Server
#version 1.0

#use the centos base image provided by dotCloud
FROM centos

MAINTAINER hipin.zhao, zhaohaibin@outlook.com

#make sure the package repository is up to date.
RUN yum update -y

#install wget
RUN yum install wget telnet git -y

#install epel
RUN wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && yum install epel-release-*.rpm -y

#make sure the package repository is up to date.
RUN yum update -y

#prepare compile envirement
RUN yum install gcc gcc-c++ -y
RUN yum install boost boost-devel boost-doc -y 

#set the right locale for postgres
RUN echo /dev/null >> /etc/sysconfig/i18n
RUN echo "LC_ALL=\"en_US.UTF-8\"\nSYSFONT=\"latarcyrheb-sun16\"" >> /etc/sysconfig/i18n

#install postgresql-server postgresql-client
RUN wget http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm && yum install pgdg-redhat93-9.3-1.noarch.rpm -y
RUN yum install postgresql93-server postgresql93 postgresql93-devel -y

#modify postgresql config file
RUN echo "#TYPE DATABASE USER ADDRESS METHOD">> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "local all all trust">> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "host all all 127.0.0.1/32 trust">> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "host all all ::1/128 trust">> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "host all all 0.0.0.0/0 md5">> /etc/postgresql/9.3/main/pg_hba.conf

#specify a volumn for postgresql persistence data.
VOLUME ["/var/lib/postgresql"]

#specify port for postgresql service
EXPOSE 5432
