FROM alpine:edge

ENV LANG=C.UTF-8 \
    TZ=UTC \
    TERM=screen-256color \
    AUTHORIZED_KEYS="" \
    USER="weechat"

STOPSIGNAL SIGCONT

RUN \
  apk add --no-cache \
    runit \
    shadow \
    openssh \
    python \
    weechat \
    weechat-aspell \
    weechat-lua \
    weechat-perl \
    weechat-ruby \
    weechat-python \
    openssl1.0 \
    rsync \
    bash \
    tzdata \
    aspell \
    aspell-en \
    tmux && \
  rm -rf /tmp/* /var/cache/apk/* /etc/motd

ADD etc/ /etc/
ADD var/ /var/

VOLUME ["/home"]

EXPOSE 22
EXPOSE 9001

CMD ["/sbin/runit-init"]
