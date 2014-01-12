FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install curl && \
    curl -s https://raw.githubusercontent.com/sammcj/docker-utils/master/apt-settings.sh | sh

RUN echo 'deb http://ppa.launchpad.net/jcfp/ppa/ubuntu utopic main' > /etc/apt/sources.list.d/sabnzbd.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 4BB9F05F && apt-get update

RUN apt-get install -y par2 python-yenc unrar unzip locales

# These must be installed on sperate apt lines to avoid a package conflict
RUN apt-get install -y sabnzbdplus 
RUN apt-get install -y sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush

RUN locale-gen en_AU en_AU.UTF-8

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8080 9090

ENTRYPOINT ["/start.sh"]
