FROM debian:stretch-slim
MAINTAINER skyfall174

RUN apt-get update \
    && apt-get install -y curl git docker \
    && mkdir ~/bin \
    && cd ~/bin \
    && curl -L https://raw.githubusercontent.com/flant/multiwerf/master/get.sh | bash \
    && rm -rf /var/lib/apt/lists/* &&    echo "done"
WORKDIR /root/bin
CMD [ "/bin/bash" ]