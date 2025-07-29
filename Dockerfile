FROM suchja/wine

USER root

# Update apt sources and install Go + Xvfb
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install --allow-unauthenticated --force-yes -y golang xvfb

# Copy source and build
COPY . /opt/say
RUN mkdir /opt/say/wavs && chmod 777 /opt/say/wavs
WORKDIR /opt/say

# Build Go binary
RUN go build

# Run with Xvfb wrapper
CMD ["xvfb-run", "-a", "/opt/say/say"]
