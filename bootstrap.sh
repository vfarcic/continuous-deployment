#!/bin/sh

# confd

wget -O confd https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64
cp confd /opt/bin/.
chmod +x /opt/bin/confd
mkdir -p /etc/confd/{conf.d,templates}
cp /vagrant/bdd_assistant.toml /etc/confd/conf.d/.
cp /vagrant/bdd_assistant.conf.tmpl /etc/confd/templates/.

# etcd

systemctl start etcd.service

# nginx
mkdir -p /etc/nginx/{sites-enabled,certs-enabled}
mkdir -p /var/log/nginx
cp /vagrant/nginx.service /etc/systemd/system/nginx.service
systemctl enable /etc/systemd/system/nginx.service
systemctl start nginx.service

# BDD Assistant
cp /vagrant/bdd_assistant.service /etc/systemd/system/bdd_assistant_blue@9001.service
cp /vagrant/bdd_assistant.service /etc/systemd/system/bdd_assistant_green@9002.service
systemctl enable /etc/systemd/system/bdd_assistant_blue@9001.service
systemctl enable /etc/systemd/system/bdd_assistant_green@9002.service
systemctl daemon-reload
etcdctl set /bdd-assistant/instance none
chmod 744 /vagrant/deploy_bdd_assistant.sh
cp /vagrant/deploy_bdd_assistant.sh /opt/bin/.
deploy_bdd_assistant.sh

