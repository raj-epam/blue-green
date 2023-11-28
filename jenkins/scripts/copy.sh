#!/bin/sh         
sftp -i $1 dhluser@$2 << !
put index.html /opt/tomcat/webapps/sample/
bye
!