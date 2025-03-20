#!/bin/bash
echo "Deploying detection rules to Wazuh server..."
scp ./rules/sshd_rules.xml wazuh@your-server:/var/ossec/etc/rules/
ssh manager@192.168.20.44 'sudo systemctl restart wazuh-manager'
echo "Deployment completed!"
