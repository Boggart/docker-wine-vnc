docker-wine-vnc
===============

A Wine container for Docker based on alpine linux, with xvfb and x0vncserver included.

## Usage:
```docker run -t --name <container name> -v <storage path>/startwine.sh:/usr/local/bin/startwine.sh:ro -v <storage path>/data:/home/winer -p <port>:<port> boggart/docker-wine-vnc```

## Sample startwine.sh:
```#!/bin/sh
export DISPLAY=:0
wname="sample wine app"

su -c "chown winer -R /home/winer" root

if [ -f "~/firstran" ]
then
    echo "[$wname]: Using previous configuration."
else
	echo "[$wname]: First run configuration."
    passw=$(pwgen 8)
    echo "[$wname]: VNC password: $passw"
    mkdir ~/.vnc
    echo "$passw" | vncpasswd -f > ~/.vnc/passwd
    winetricks -q settings windowmanagerdecorated=n windowmanagermanaged=n
    touch ~/firstran
fi
while :
do
	echo "[$wname]: Starting."
    Xvfb -screen 0 800x600x16 &
    sleep 2
    x0vncserver -display $DISPLAY -passwordfile ~/.vnc/passwd -rfbport 5900 &
    wine notepad.exe
    killall x0vncserver
    killall xvfb
done
echo "[$wname]: Exiting."```
