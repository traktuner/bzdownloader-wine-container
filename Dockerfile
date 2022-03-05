FROM jlesage/baseimage-gui:ubuntu-20.04

RUN apt-get update && apt-get full-upgrade -y

RUN apt-get install -y curl wget software-properties-common gnupg2 winbind xvfb unzip

RUN dpkg --add-architecture i386
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN apt-get update
RUN apt-get install -y winehq-stable

RUN apt-get install -y winetricks

RUN apt-get clean -y && apt-get autoremove -y

ENV WINEPREFIX /config/wine/

RUN \
    APP_ICON_URL=https://www.backblaze.com/pics/cloud-blaze.png && \
    install_app_icon.sh "$APP_ICON_URL"
    
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

ENV APP_NAME="Backblaze Downloader"

# Disable WINE Debug messages
ENV WINEDEBUG -all

# Configure wine to run without mono or gecko as they are not required
ENV WINEDLLOVERRIDES mscoree,mshtml=

EXPOSE 5900

COPY startapp.sh /startapp.sh
