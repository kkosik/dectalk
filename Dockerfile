FROM suchja/wine:latest

USER root

RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install --allow-unauthenticated -y golang xvfb

RUN apt-get update && apt-get install -y golang Xvfb

COPY . /opt/say
RUN mkdir /opt/say/wavs && chmod 777 /opt/say/wavs

# Bypassing the xclient user
RUN chown root:root /home/xclient

WORKDIR /opt/say

RUN go build

CMD /opt/say/say
