FROM alpine:3.6

RUN apk add --update bash && \
  apk add --update-cache socat --repository http://dl-3.alpinelinux.org/alpine/edge/main

COPY tcp-proxy.sh /usr/bin/tcp-proxy

ENTRYPOINT ["tcp-proxy"]
