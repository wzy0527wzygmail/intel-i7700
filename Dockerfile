FROM debian

RUN dpkg --add-architecture i386

RUN apt update

RUN DEBIAN_FRONTEND=noninteractive apt install wine qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox-esr gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget   -y

RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz

RUN tar -xvf v1.2.0.tar.gz

RUN mkdir  $HOME/.vnc

RUN echo 'wzy0527wzy@gmail.com' | vncpasswd -f > $HOME/.vnc/passwd

RUN echo '/bin/env  MOZ_FAKE_NO_SANDBOX=1  dbus-launch xfce4-session'  > $HOME/.vnc/xstartup

RUN chmod 600 $HOME/.vnc/passwd

RUN chmod 755 $HOME/.vnc/xstartup

RUN echo 'whoami ' >>/wzy0527wzy@gmail.com.sh

RUN echo 'cd ' >>/wzy0527wzy@gmail.com.sh

RUN echo "su -l -c 'vncserver :2000 -geometry 1360x768' "  >>/wzy0527wzy@gmail.com.sh

RUN echo 'cd /noVNC-1.2.0' >>/wzy0527wzy@gmail.com.sh

RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 13900 ' >>/wzy0527wzy@gmail.com.sh

RUN chmod 755 /wzy0527wzy@gmail.com.sh

EXPOSE 13900

CMD  /wzy0527wzy@gmail.com.sh
