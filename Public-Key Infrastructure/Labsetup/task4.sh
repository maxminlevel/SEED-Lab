#!/bin/bash
set -e

nano /etc/hosts
#or
gedit /etc/hosts

#add
10.9.0.80       cuong2022.com

cp server.key server.pem
cat server.crt >> server.pem

#add <VirtualHost> element into default_ssl.conf 
nano /etc/apache2/sites-available/default-ssl.conf

<VirtualHost *:443>
	DocumentRoot /var/www/pki
	ServerName cuong2022.com
	ServerAlias cuong2022A.com
	ServerAlias cuong2022B.com
	DirectoryIndex index.html
	
	SSLEngine On
	SSLCertificateFile /var/www/pki/server.crt
	SSLCertificateKeyFile /var/www/pki/server.pem
</VirtualHost>

mkdir /var/www/pki
cp server.pem server.crt /var/www/pki
cp /var/www/bank32/index.html /var/www/pki/

apachectl configtest
a2enmod ssl
a2ensite default-ssl
service apache2 restart

echo "Completed"