FROM suchja/wine

USER root

# Update sources for old Debian archive & install Go + Xvfb
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install --allow-unauthenticated --force-yes -y golang xvfb

# Copy app source
COPY . /opt/say
RUN mkdir /opt/say/wavs && chmod 777 /opt/say/wavs

# Optional Wine fix (if needed)
RUN chown root:root /home/xclient

WORKDIR /opt/say

# Enable Go modules and build the app (if applicable)
# COPY go.mod go.sum ./
# RUN go mod download
RUN go build

CMD ["/opt/say/say"]
