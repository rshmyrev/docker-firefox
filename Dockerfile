FROM alpine:latest
LABEL maintainer="rshmyrev <rshmyrev@gmail.com>"

# Install Firefox
RUN apk --no-cache --no-progress upgrade && apk add --no-cache \
    firefox \
    font-dejavu \
    pulseaudio \
    pulseaudio-alsa

# Create a user and directories
RUN adduser -D user \
 && mkdir -p /cache /config /downloads \
 && ln -s /cache     /home/user/.cache \
 && ln -s /config    /home/user/.mozilla \
 && ln -s /downloads /home/user/Downloads \
 && chown -R user:user /cache /config /downloads /home/user

VOLUME ["/cache", "/config", "/downloads"]
WORKDIR /home/user
USER user
ENTRYPOINT ["/usr/bin/firefox"]
