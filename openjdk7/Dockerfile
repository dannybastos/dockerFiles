FROM alpine:3.9

MAINTAINER Danny Bastos <danny.bastos.br@gmail.com>

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

RUN apk --progress --no-cache add \
    bash \
    nss \
    openjdk7-jre; \
    java -Xshare:dump; \
  	java -version; 

ENTRYPOINT bash
