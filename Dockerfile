FROM kalilinux/kali-rolling:latest

LABEL description="Kali Linux with XFCE Desktop and VNC"
LABEL Maintainer="Prajyot Chemburkar <prajyotchemburkar@gmail.com>"

# Install kali packages

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install kali-linux-everything
RUN apt-get clean

# Install kali desktop

RUN apt-get -y install kali-desktop-xfce
RUN apt-get -y install tightvncserver dbus dbus-x11 net-tools

ENV USER root

ENV VNCPORT 5900
ENV VNCPWD password
ENV VNCDISPLAY 1280x720
ENV VNCDEPTH 16

# Install custom packages
# TODO: ohmyzsh, powerlevel10k

RUN apt-get -y install vim curl

# Entrypoint

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
