# socat-proxy-docker

## Description

Simple utility based on socat to relay tcp traffic to a specific host:port.

It can prove useful if you want to temporarily bind a running container port to your host.

## Usage

```bash
socat-proxy host[:port=80]
```

## Examples

To relay all TCP connections on your port `8080` to `my.cool.host:1234`:

```bash
docker run -it --rm -p 8080:80 hpello/socat-proxy my.cool.host:1234
```

You would like to access a container running on the `compose_default` network, with name `api` and port `1234`?

```bash
docker run -d --network compose_default -p 8080:80 hpello/socat-proxy api:1234
```

## Listen port

By default, socat-proxy will listen on port 80, which is exposed in Dockerfile.
This can be changed by setting the `LISTEN_PORT` environment variable.
