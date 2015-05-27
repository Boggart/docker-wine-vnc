FROM gliderlabs/alpine:latest
MAINTAINER Boggart "github.com/Boggart"
RUN apk add --update pwgen xvfb wine openssl && rm -rf /var/cache/apk/* && mkdir /var/empty && rm /sbin/apk
RUN adduser -D -s /bin/bash winer
RUN wget https://bintray.com/artifact/download/tigervnc/stable/tigervnc-Linux-x86_64-1.4.3.tar.gz && tar zxf tigervnc-Linux-x86_64-1.4.3.tar.gz ./usr -C / && rm tigervnc-Linux-x86_64-1.4.3.tar.gz
RUN wget http://winetricks.org/winetricks && chmod +x winetricks && mv winetricks /usr/bin/winetricks && ln -s /usr/bin/wine64 /usr/bin/wine
USER winer
CMD ["~/startwine.sh"]

