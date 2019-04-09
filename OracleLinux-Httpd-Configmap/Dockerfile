FROM oraclelinux:7-slim

RUN rm /etc/yum.repos.d/*
COPY public-yum-ol7.repo /etc/yum.repos.d/public-yum-ol7.repo
# need to set proxy if it is behind the firewall
RUN echo "proxy=http://<proxy server:80" >> /etc/yum.conf && \
    yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

# in the run-httpd.sh we add cp command to copy files in configmap to local /etc/httpd/conf
CMD ["/run-httpd.sh"]
