# Test, run tomcat into docker container
FROM ubuntu:20.04
RUN apt-get update -y
RUN apt install maven -y
RUN apt-get install default-jdk -y
RUN apt-get install git -y

# Install docker 18.03
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz