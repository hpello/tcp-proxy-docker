FROM alpine:3.5

RUN apk add --update \
  bash \
  socat

COPY socat-proxy.sh /usr/bin/socat-proxy

ENTRYPOINT ["socat-proxy"]
