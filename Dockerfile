FROM suchja/wine

USER root

# Update sources and install packages
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install --allow-unauthenticated --force-yes -y golang xvfb xauth x11-utils

# Copy app source
COPY . /opt/say
RUN mkdir -p /opt/say/wavs && chmod 777 /opt/say/wavs

# Build the Go app
WORKDIR /opt/say
RUN go build

# Add entrypoint script
COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

# Set default command
ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["/opt/say/say"]
