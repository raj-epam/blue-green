#!/bin/sh         
sftp -i $1 dhluser@10.0.0.5 << !
put index.html /opt/tomcat/webapps/sample/index.html
bye
!