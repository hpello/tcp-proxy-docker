FROM alpine:3.20.3

RUN apk update && \
    apk upgrade --available && \
    apk add --no-cache bash socat && \
    sync

# Set a working directory
WORKDIR /usr/bin

# Copy the script to the working directory
COPY tcp-proxy.sh .

# Use exec form for ENTRYPOINT
ENTRYPOINT ["./tcp-proxy"]

