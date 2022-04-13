#!/bin/bash

# Re-create container, remove network
sudo docker stop redis-test && sudo docker rm redis-test
sudo docker run -d --name redis-test redis:alpine
sudo docker network rm redis-test-net

# Remove audit entries
echo '' | sudo tee /etc/audit/rules.d/audit.rules > /dev/null
sudo service auditd restart
