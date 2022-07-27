[db_server]
db-0 ansible_host=${db-0-ip}

[web_servers]
web-0 ansible_host=${web-0-ip}
web-1 ansible_host=${web-1-ip}
web-2 ansible_host=${web-2-ip}

[load_balancer_servers]
lb-0 ansible_host=${lb-0-ip} priority=101 state=MASTER
lb-1 ansible_host=${lb-1-ip} priority=100 state=BACKUP

[iscsi]
iscsi-0 ansible_host=${iscsi-0-ip}