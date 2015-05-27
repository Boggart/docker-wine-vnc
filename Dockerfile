FROM gliderlabs/alpine:latest
MAINTAINER Boggart "github.com/Boggart"
RUN apk add --update pwgen xvfb wine openssl && rm -rf /var/cache/apk/* && mkdir /var/empty && rm /sbin/apk
RUN adduser -D -s /bin/bash winer
RUN wget https://bintray.com/artifact/download/tigervnc/stable/tigervnc-Linux-i686-1.4.3.tar.gz && tar zxf tigervnc-Linux-i686-1.4.3.tar.gz ./usr -C /usr
USER winer
CMD ["~/startwine.sh"]

