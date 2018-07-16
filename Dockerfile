FROM alpine:edge

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
    aspell \
    aspell-en \
    tmux && \
  apk add \
    --no-cache \
    --virtual build-dependencies \
    lua-cjson \
    python-dev \
    py-pip \
    libffi \
    libffi-dev \
    mpc1-dev \
    gmp-dev \
    mpfr-dev \
    openssl1.0-dev \
    build-base && \
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
