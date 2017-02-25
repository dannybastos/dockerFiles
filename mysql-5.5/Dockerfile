FROM ubuntu:14.04

RUN export DEBIAN_FRONTEND="noninteractive" && \
	apt-get update && \
	apt-get -y install mysql-server mysql-client && \
	apt-get clean && \
	apt-get autoremove

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN service mysql start && \
	mysql_install_db && \
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql

EXPOSE 3306

ENTRYPOINT ["/usr/bin/mysqld_safe"]
