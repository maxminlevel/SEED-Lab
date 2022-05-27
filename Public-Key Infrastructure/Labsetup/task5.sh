#!/bin/bash
set -e

openssl req -newkey rsa:2048 -sha256 -keyout fb.key -out fb.csr -subj "/CN=facebook.com/O=Bank32 Inc./C=US" -passout pass:dees

openssl ca -config myCA_openssl.cnf -policy policy_anything \
-md sha256 -days 3650 \
-in fb.csr -out fb.crt -batch \
-cert ca.crt -keyfile ca.key

cp fb.key fb.pem
cat fb.crt >> fb.pem

mkdir /var/www/fb
cp fb.crt fb.pem /var/www/fb
cp /var/www/html/index.html /var/www/fb

#add <VirtualHost> element into default_ssl.conf
nano /etc/apache2/sites-available/default-ssl.conf

<VirtualHost *:443>
	DocumentRoot /var/www/fb
	ServerName facebook.com
	ServerAlias fb.com
	ServerAlias mobile.facebook.com
	DirectoryIndex index.html
        
	SSLEngine On
	SSLCertificateFile /var/www/fb/fb.crt
	SSLCertificateKeyFile /var/www/fb/fb.pem
</VirtualHost>

#run
apachectl configtest
service apache2 restart

#add DNS
gedit /etc/hosts
10.9.0.80	facebook.com

echo "Completed"