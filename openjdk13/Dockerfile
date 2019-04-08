FROM alpine:3.9

MAINTAINER Danny Bastos <danny.bastos.br@gmail.com>

ENV JAVA_HOME /opt/openjdk13
ENV PATH $PATH:$JAVA_HOME/bin

RUN apk --no-cache add wget tar gzip bash; \
	wget -q https://download.java.net/java/early_access/alpine/9/binaries/openjdk-13-ea+9_linux-x64-musl_bin.tar.gz; \
	tar -xvf openjdk-13-ea+9_linux-x64-musl_bin.tar.gz; \
	mv jdk-13 $JAVA_HOME; \
	rm openjdk-13-ea+9_linux-x64-musl_bin.tar.gz; \
	java -Xshare:dump; \
	java --version; \
	javac --version

ENTRYPOINT bash
