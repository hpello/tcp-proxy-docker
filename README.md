# tcp-proxy-docker

## Description

Simple utility to relay tcp traffic to a specific host and port.

It can prove useful if you want to temporarily bind a running container port to your host.

## Usage

```bash
tcp-proxy host port
```

## Examples

To relay all TCP connections on your port `1234` to `my.cool.host:8080`:

```bash
docker run -it --rm -p 1234:8080 hpello/tcp-proxy my.cool.host 8080
```

To access a container running on the `compose_default` network, with name `api` and port `8080`:

```bash
docker run -it --rm --network compose_default -p 1234:8080 hpello/tcp-proxy api 8080
```

## Listen port

By default, tcp-proxy will listen on the same port as the one specified.

This can be overriden by setting the `LISTEN_PORT` environment variable.
