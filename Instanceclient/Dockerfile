# LICENSE UPL 1.0
#
# Copyright (c) 2014, 2019, Oracle and/or its affiliates. All rights reserved.
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
#
# Dockerfile template for Oracle Instant Client
#
# HOW TO BUILD THIS IMAGE
# -----------------------
#
# Run:
#      $ docker build -t oracle/instantclient:18 .
#
#
FROM oraclelinux:7-slim

ARG release=18
ARG update=3
RUN rm /etc/yum.repos.d/*
# add proxy if it is behind proxy
RUN echo "proxy=http://<proxy server:80" >> /etc/yum.conf
COPY yum-iad-ol7.repo /etc/yum.repos.d/yum-iad-ol7.repo 
RUN yum-config-manager --enable ol7_oci_included
RUN yum-config-manager --enable ol7_oracle_instantclient && \
     yum -y install oracle-instantclient${release}.${update}-basic oracle-instantclient${release}.${update}-devel oracle-instantclient${release}.${update}-sqlplus && \
     rm -rf /var/cache/yum && \
     echo /usr/lib/oracle/${release}.${update}/client64/lib > /etc/ld.so.conf.d/oracle-instantclient${release}.${update}.conf && \
     ldconfig

ENV PATH=$PATH:/usr/lib/oracle/${release}.${update}/client64/bin

CMD ["sqlplus", "-v"]
