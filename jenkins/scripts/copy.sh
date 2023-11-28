#!/bin/sh         
sftp -i $1 dhluser@$2 << !
put index.html /opt/tomcat/webapps/index.html
bye
!