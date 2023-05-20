FROM ubuntu

WORKDIR /tmp/project
COPY . .
RUN apt update && apt install -y coreutils git make
RUN make install
WORKDIR /root

ENTRYPOINT "/bin/bash"