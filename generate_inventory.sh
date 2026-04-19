#!/bin/bash

BASTION_IP=$(terraform output -raw bastion_public_ip)

cat > hosts.ini << EOF
[all:vars]
ansible_user=user
ansible_ssh_private_key_file=~/.ssh/yassh
ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q user@${BASTION_IP}"'

[elastic]
elastic_srv ansible_host=elastic.ru-central1.internal

[kibana]
kibana_srv ansible_host=kibana.ru-central1.internal

[web]
web-1 ansible_host=web-1.ru-central1.internal
web-2 ansible_host=web-2.ru-central1.internal

[zabbix]
zabbix_srv ansible_host=zabbix.ru-central1.internal
EOF

echo "✅ hosts.ini сгенерирован"