FROM alpine:latest

RUN apk add --no-cache \
    git \
    npm \
    py3-pip

RUN python3 -m pip install -U pip setuptools wheel \
    && python3 -m pip install --force-reinstall https://github.com/yt-dlp/yt-dlp/archive/master.tar.gz \
    && git clone https://github.com/coissac/upnpTube /tmp/upnpTube \
    && cd /tmp/upnpTube \
    && npm ci \
    && npm link

ENTRYPOINT [ "node", "/usr/local/bin/upnpTube" ]
