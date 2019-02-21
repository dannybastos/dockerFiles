FROM alpine:latest

RUN \
  apk update && \
  apk upgrade && \
  apk add bash openjdk8 && \
  rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

WORKDIR /tmp

CMD ["bash"]
