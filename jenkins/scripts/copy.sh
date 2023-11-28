#!/bin/sh         
sftp -o StrictHostKeyChecking=no -i $1 dhluser@$2 << !
put index.html /opt/tomcat/webapps/sample/
bye
!