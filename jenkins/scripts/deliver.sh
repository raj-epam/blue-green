#!/usr/bin/env bash
ssh -o StrictHostKeyChecking=no -i $1 dhluser@$3 << EOF 
sudo ls /opt/tomcat/webapps
sudo mkdir -p /opt/tomcat/backup/$(date +%F)/$2
sudo cp /opt/tomcat/webapps/sample/index.html /opt/tomcat/backup/$(date +%F)/$2/
sudo rm -f /opt/tomcat/webapps/sample/index.html
sudo mkdir -p /opt/tomcat/webapps/sample
sudo chmod 777 /opt/tomcat/webapps/sample
EOF
 