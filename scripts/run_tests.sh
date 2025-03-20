#!/bin/bash
echo "Simulating SSH brute-force attack..."
for i in {1..50}; do ssh user@localhost -o ConnectTimeout=1; done
echo "Checking Wazuh logs for alerts..."
grep "SSH brute force attack detected" /var/ossec/logs/alerts/alerts.log || echo "Test failed!"
