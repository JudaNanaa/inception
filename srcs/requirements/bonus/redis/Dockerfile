FROM alpine:3.20

# Set environment variables for Redis
ENV REDIS_VERSION=7.0.12
ENV BUILD_DEPS="gcc make musl-dev linux-headers"
ENV RUN_DEPS="ca-certificates"

# Install build dependencies and runtime dependencies
RUN apk add --no-cache $BUILD_DEPS $RUN_DEPS \
    && wget http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz \
    && tar xzf redis-${REDIS_VERSION}.tar.gz \
    && cd redis-${REDIS_VERSION} \
    && make \
    && make install \
    && cd .. \
    && rm -rf redis-${REDIS_VERSION} redis-${REDIS_VERSION}.tar.gz \
    && apk del $BUILD_DEPS

RUN adduser -D -g '' redis

# Then create the data directory and adjust permissions
RUN mkdir /data && chown redis:redis /data && chmod 755 /data


# Add custom redis.conf file
COPY redis.conf /etc/redis.conf

# Expose Redis default port
EXPOSE 6379

# Default command to run Redis server with custom configuration
CMD ["redis-server", "/etc/redis.conf"]
