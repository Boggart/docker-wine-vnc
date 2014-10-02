FROM ubuntu
MAINTAINER Boggart <github.com/boggart>

RUN dpkg --add-architecture i386 && \
  apt-get update -y && \
  apt-get install -y bash python-software-properties && add-apt-repository -y ppa:ubuntu-wine/ppa

RUN apt-get update -y && \
  apt-get install -y wine1.7:i386 winetricks xvfb x11vnc supervisor

RUN apt-get purge -y python-software-properties && apt-get autoclean -y
RUN useradd -ms /bin/bash winer

ADD ./supervisor/supervisor.conf /etc/supervisor/supervisor.conf
ADD ./supervisor/wineapp.sv.conf /etc/supervisor/conf.d/
USER winer
CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf"]
