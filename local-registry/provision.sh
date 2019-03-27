yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2 wget

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce-selinux-17.03.3.ce-1.el7 containerd.io

# add user to docker group
usermod -aG docker vagrant #$USER

wget -q "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -O /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#restarting docker
systemctl enable docker.service
systemctl restart docker.service
systemctl stop firewalld.service
systemctl disable firewalld.service

#setting up keys
mkdir -p /home/vagrant/registry/certs /home/vagrant/registry/auth /home/vagrant/registry-data
cd /home/vagrant/registry/certs
openssl genrsa 1024 > my-registry.key
chmod 400 my-registry.key
openssl req -new -x509 -nodes -sha1 -days 365 -key my-registry.key -out my-registry.crt -batch
cd /home/vagrant/registry/auth/
docker run --rm --entrypoint htpasswd registry:2 -Bbn admin secret > htpasswd
cd
cp /vagrant/docker-compose.yml /home/vagrant/ -v
chown vagrant:vagrant /home/vagrant -R
#su user=vagrant docker-compose -f /home/vagrant/docker-compose.yml up -d
