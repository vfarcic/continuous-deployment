#!/bin/sh

if [[ "$(etcdctl get /bdd-assistant/instance)" = "bdd_assistant_blue" ]]; then
    systemctl start bdd_assistant_green@9002.service
    confd -onetime -backend etcd -node 127.0.0.1:4001
    sleep 5
    systemctl stop bdd_assistant_blue@9001.service
else
    systemctl start bdd_assistant_blue@9001.service
    confd -onetime -backend etcd -node 127.0.0.1:4001
    sleep 5
    systemctl stop bdd_assistant_green@9002.service
fi
