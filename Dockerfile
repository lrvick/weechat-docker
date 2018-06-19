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
    tmux && \
    rm -rf /tmp/* /var/cache/apk/* /etc/motd && \
  useradd -m -d /home/weechat -s /bin/sh weechat && \
  usermod -p '*' weechat

STOPSIGNAL SIGCONT

ENV AUTHORIZED_KEYS ""

ADD etc/ /etc/
ADD var/ /var/

VOLUME ["/home/weechat"]

EXPOSE 22

CMD ["/sbin/runit-init"]
