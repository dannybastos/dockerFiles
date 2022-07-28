FROM alpine:3

RUN apk --no-cache add \
  openjdk11-jdk \
  wget


RUN cd /opt && \
  wget https://github.com/keycloak/keycloak/releases/download/18.0.2/keycloak-18.0.2.tar.gz && \
  tar xzvf keycloak-18.0.2.tar.gz && \
  rm -rf keycloak-18.0.2.tar.gz

EXPOSE 8080

#ENV KEYCLOAK_ADMIN=admin
#ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENTRYPOINT ["sh", "/opt/keycloak-18.0.2/bin/kc.sh", "start-dev","-Djboss.bind.address=0.0.0.0","-Djboss.bind.address.management=0.0.0.0"]

