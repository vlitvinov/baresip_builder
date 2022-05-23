FROM debian:latest as builder

WORKDIR /root/
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y make git gcc libssl-dev pkg-config
RUN apt-get install -y libopus-dev libgsm1-dev libpulse-dev libasound2-dev libspandsp-dev 
RUN apt-get install -y gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools gstreamer1.0-x libgstreamer-plugins-base1.0-0 libgstreamer-plugins-base1.0-dev libgstreamer1.0-0 libgstreamer1.0-dev
RUN apt-get install -y dpkg-dev debhelper
RUN apt-get install -y libbcg729-dev
RUN apt-get install -y libgtk2.0-dev
RUN apt-get install -y libgtk-3-dev
RUN apt-get install -y libvpx-dev

COPY entrypoint.sh /root/
RUN chmod +x /root/entrypoint.sh

CMD /root/entrypoint.sh
