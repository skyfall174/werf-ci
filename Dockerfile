FROM debian:stretch-slim
MAINTAINER skyfall174

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables curl git 

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker




RUN mkdir ~/bin \
    && cd ~/bin \
    && curl -L https://raw.githubusercontent.com/flant/multiwerf/master/get.sh | bash \
    && rm -rf /var/lib/apt/lists/* &&    echo "done"
WORKDIR /root/bin

CMD ["wrapdocker"]