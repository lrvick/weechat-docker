FROM alpine:edge

RUN \
  apk add --no-cache \
    runit \
    shadow \
    openssh \
    python3 \
    python \
    weechat \
    weechat-aspell \
    weechat-lua \
    weechat-perl \
    weechat-ruby \
    weechat-python \
    rsync \
    bash \
    tmux && \
    rm -rf /tmp/* /var/cache/apk/* /etc/motd

STOPSIGNAL SIGCONT

ENV AUTHORIZED_KEYS ""
ENV USER "weechat"

ADD etc/ /etc/
ADD var/ /var/

VOLUME ["/home"]

EXPOSE 22
EXPOSE 9000

CMD ["/sbin/runit-init"]
