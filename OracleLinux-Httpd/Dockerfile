FROM oraclelinux:7-slim

RUN rm /etc/yum.repos.d/*
COPY public-yum-ol7.repo /etc/yum.repos.d/public-yum-ol7.repo
RUN echo "proxy=http://10.68.69.53:80" >> /etc/yum.conf && \
    yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
