FROM alpine:3.20

RUN apk update && apk add --no-cache \
    bash \
    curl \
    docker-cli

# RUN curl -L https://portainer.io/downloads-portainer -o portainer-ce.tar.gz && \
#     tar -xzf portainer-ce.tar.gz && \
#     mv portainer /usr/local/bin/

RUN mkdir -p /data

EXPOSE 9000

# CMD ["portainer", "--no-auth"]
CMD ["sleep", "infinity"]
