# Test, run tomcat into docker container
FROM ubuntu:20.04
RUN apt-get update -y
RUN apt install maven -y
RUN apt-get install default-jdk -y
RUN apt-get install git -y

