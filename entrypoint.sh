#!/bin/bash
cat <<EOF > /ansible/hosts
[tor]
$ONION_ADDRESS

[tor:vars]
ansible_user=$SSH_USER
ansible_password=$SSH_PASSWORD
ansible_network_os=tor
network_os=tor
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o "ProxyCommand socat - SOCKS4A:localhost:%h:%p,socksport=9050"'
EOF

cd /ansible && sshpass ansible-playbook -i hosts playbook.yml -vvvv