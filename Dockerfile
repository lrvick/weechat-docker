FROM alpine:3.7

ADD sshd_config /etc/ssh/
ADD tmux.conf /etc/tmux.conf
ADD login.sh /usr/local/bin/login.sh
ADD startup.sh /usr/local/bin/startup.sh

RUN \
  apk add --no-cache \
    shadow \
    openssh \
    weechat \
    weechat-aspell \
    weechat-lua \
    weechat-perl \
    weechat-ruby \
    weechat-python \
    tmux && rm -rf /tmp/* /var/cache/apk/* && \
  useradd \
    -m -d /home/weechat \
    -s /usr/local/bin/login.sh weechat

VOLUME ["/home/weechat"]

EXPOSE 22

CMD ["/usr/local/bin/startup.sh"]
