#!/usr/bin/env bash

export LC_ALL="en_US.UTF-8"
echo ". /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh" >> /etc/profile
source /etc/profile

sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" $ORACLE_HOME/network/admin/listener.ora
sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" $ORACLE_HOME/network/admin/tnsnames.ora

/etc/init.d/oracle-xe start
tailf /u01/app/oracle/diag/rdbms/xe/XE/trace/alert_XE.log
