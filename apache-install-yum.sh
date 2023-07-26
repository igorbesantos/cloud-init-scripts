#!/bin/bash -x
iptables -A INPUT -p tcp -m multipot --dports 80,443 -j ACCEPT
yum -y install httpd
systemctl enable httpd.service
systemctl start httpd.service
firewall-offline-cmd --add-service=http
firewall-offline-cmd --add-service=https
systemctl enable firewalld
systemctl restart firewalld
echo Hello World!!> /var/www/html/index.html
