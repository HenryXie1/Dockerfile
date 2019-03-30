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

RUN chmod +x /usr/bin/postgresql-setup
RUN chmod +x /start_postgres.sh

#add ln to fix initdb not found issue
RUN ln -s /usr/pgsql-9.5/bin/initdb  /usr/bin/initdb
RUN /usr/bin/postgresql-setup initdb

ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf

RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf

RUN echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf

VOLUME ["/var/lib/pgsql"]

EXPOSE 5432

CMD ["/bin/bash", "/start_postgres.sh"]
