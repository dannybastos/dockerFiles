FROM centos:7

MAINTAINER Danny Bastos <https://github.com/dannybastos>

RUN yum install -y libaio bc flex unzip; \
    yum clean all

RUN groupadd -g 54321 oinstall ; \
    groupadd -g 54322 dba ; \
    groupadd -g 54323 oper ; \
    useradd -g oinstall -G dba,oper oracle ; \
    echo "oracle" | passwd --stdin oracle ; \
    mkdir -p /u01/app/oracle/product/11.2.0/db_1 ; \
    chown -R oracle:dba /u01 ; \
    chmod -R 775 /u01 ; \
    mkdir -p /mnt/oracle

ADD oracle-xe-11.2.0-1.0.x86_64.rpm.zip /mnt/oracle

RUN cd /mnt/oracle ; \
    unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip ; \
    cd /mnt/oracle/Disk1/response ; \
    cp xe.rsp xe.rsp.orig ; \
    chmod 755 xe.rsp ; \
    sed -i "s/<value required>/oracle/" xe.rsp; \
    rpm -ivh  /mnt/oracle/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm && \
    sed -i "s/memory_target/#memory_target/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora && \
    sed -i "s/memory_target/#memory_target/g" /u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora && \
    /etc/init.d/oracle-xe configure responseFile=/mnt/oracle/Disk1/response/xe.rsp && \
    rm -rf /mnt/oracle && \
    sed -i "s/xe:N/xe:S/" /etc/oratab && \
    usermod -aG dba root

EXPOSE 1521
EXPOSE 8080

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
