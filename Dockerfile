FROM gliderlabs/alpine:latest
MAINTAINER Boggart "github.com/Boggart"
RUN apk add --update pwgen xvfb wine openssl && rm -rf /var/cache/apk/* && mkdir /var/empty && rm /sbin/apk
RUN adduser -D -s /bin/bash winer
RUN wget https://bintray.com/artifact/download/tigervnc/stable/tigervnc-Linux-i686-1.4.3.tar.gz
 && tar xf tigervnc-Linux-i686-1.4.3.tar.gz ~./tmp/vnc && cp -r ~./tmp/vnc/usr/* /usr/ && rm -rf ~./tmp
RUN wget http://winetricks.org/winetricks && chmod +x winetricks && mv winetricks /usr/bin/winetricks
USER winer
CMD ["~/startwine.sh"]

