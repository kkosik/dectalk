FROM suchja/wine

USER root
#RUN apt-get update && apt-get install -y golang xvfb

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update
#RUN apt-get install -y golang xvfb

COPY . /opt/say
RUN mkdir /opt/say/wavs && chmod 777 /opt/say/wavs

# Bypassing the xclient user
RUN chown root:root /home/xclient

WORKDIR /opt/say

RUN go build

CMD /opt/say/say
