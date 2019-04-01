# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM oraclelinux:7

RUN rm /etc/yum.repos.d/*
COPY public-yum-ol7.repo /etc/yum.repos.d/public-yum-ol7.repo
COPY pgdg-oraclelinux95-9.5-3.noarch.rpm /tmp
RUN rpm -iUvh /tmp/pgdg-oraclelinux95-9.5-3.noarch.rpm
RUN mkdir -p /usr/share/man/man1
RUN yum -y update; yum clean all
RUN yum -y install sudo epel-release; yum clean all
RUN yum -y install postgresql95-server postgresql95 postgresql95-contrib supervisor pwgen; yum clean all

ADD ./postgresql-setup /usr/bin/postgresql-setup
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start_postgres.sh /start_postgres.sh
ADD ./postgresql.conf /tmp/postgresql.conf

RUN chmod +x /usr/bin/postgresql-setup
RUN chmod +x /start_postgres.sh
RUN ln -s /usr/pgsql-9.5/bin/initdb  /usr/bin/initdb
RUN echo "export PATH=$PATH:/usr/pgsql-9.5/bin" >> /root/.bash_profile

VOLUME ["/u02/pgsql-data"]

EXPOSE 5432

CMD ["/bin/bash", "/start_postgres.sh"]
