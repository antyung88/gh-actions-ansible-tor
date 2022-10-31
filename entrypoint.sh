#!/bin/bash
cat <<EOF > /ansible/hosts
[tor]
root@$ONION_ADDRESS ansible_user=$SSH_USER ansible_ssh_pass=$SSH_PASSWORD ansible_python_interpreter=/usr/bin/python3
[tor:vars]
ansible_ssh_common_args='-o "ProxyCommand socat - SOCKS4A:localhost:%h:%p,socksport=9050"'
EOF

cd /ansible && sshpass ansible-playbook --ask-pass -i hosts playbook.yml -v