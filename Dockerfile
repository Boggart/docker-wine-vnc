FROM ubuntu
MAINTAINER Boggart <github.com/boggart>

RUN apt-get update -y && \
  apt-get install -y python-software-properties && add-apt-repository -y ppa:ubuntu-wine/ppa

RUN apt-get update -y && \
  apt-get install -y wine1.7 winetricks xvfb x11vnc supervisor

RUN apt-get purge -y python-software-properties && apt-get autoclean -y

CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf"]
