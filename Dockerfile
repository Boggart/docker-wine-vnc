FROM gliderlabs/alpine:edge
MAINTAINER Boggart "github.com/Boggart"
RUN apk add --update pwgen xfvb wine winetricks && rm -rf /var/cache/apk/* && mkdir /var/empty && rm /sbin/apk
RUN useradd -ms /bin/bash winer
RUN wget https://bintray.com/artifact/download/tigervnc/stable/tigervnc-Linux-i686-1.4.3.tar.gz
RUN tar xf tigervnc-Linux-i686-1.4.3.tar.gz ~./tmp/vnc
RUN cp -r ~./tmp/vnc/usr/* /usr/
RUN rm -rf ~./tmp
USER winer
CMD ["~/startwine.sh"]

