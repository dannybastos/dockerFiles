FROM ubuntu:18.04

MAINTAINER Danny Bastos <danny.bastos.br@gmail.com>

ENV JAVA_HOME /opt/openjdk11
ENV PATH $PATH:$JAVA_HOME/bin

RUN apt-get update; \
    apt-get install -y wget;\
    wget -q https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz; \
    tar -xvf openjdk-11.0.2_linux-x64_bin.tar.gz; \
    mv jdk-11.0.2 $JAVA_HOME; \
    rm openjdk-11.0.2_linux-x64_bin.tar.gz; \
    apt-get autoclean autoremove; \
    java -Xshare:dump; \
    java --version; \
    javac --version

ENTRYPOINT bash
