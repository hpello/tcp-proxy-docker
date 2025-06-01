FROM alpine:3.22.0

RUN apk add --update bash socat

COPY tcp-proxy.sh /usr/bin/tcp-proxy

ENTRYPOINT ["tcp-proxy"]
