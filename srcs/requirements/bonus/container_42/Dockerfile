FROM debian:bullseye

RUN apt-get update && apt-get install -y vim \
    lldb \
    valgrind \
    curl \
    wget \
    git \
    bash \
    clang \
    make

WORKDIR /app

CMD ["/bin/bash"]