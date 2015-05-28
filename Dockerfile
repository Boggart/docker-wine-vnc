FROM gliderlabs/alpine:latest
MAINTAINER Boggart "github.com/Boggart"
RUN apk add --update pwgen xvfb wine linux-pam wget && rm -rf /var/cache/apk/* && mkdir /var/empty && rm /sbin/apk
RUN adduser -D -s /bin/bash winer
RUN wget --no-check-certificate "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-2.21-r2.apk && \
    wget --no-check-certificate "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-bin-2.21-r2.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib
RUN wgett --no-check-certificate https://bintray.com/artifact/download/tigervnc/stable/tigervnc-Linux-x86_64-1.4.3.tar.gz && tar zxf tigervnc-Linux-x86_64-1.4.3.tar.gz ./usr -C / && rm tigervnc-Linux-x86_64-1.4.3.tar.gz
RUN wgett --no-check-certificate http://winetricks.org/winetricks && chmod +x winetricks && mv winetricks /usr/bin/winetricks && ln -s /usr/bin/wine64 /usr/bin/wine
USER winer
CMD ["~/startwine.sh"]

