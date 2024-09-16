#!/bin/bash

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/hosting-wordpress.html
# Install LAMP
yum update -y
yum install -y httpd mysql
amazon-linux-extras enable php7.4
yum clean metadata
yum install -y php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap,devel}
sudo systemctl start httpd
cd /var/www/html

# Install WordPress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm -f latest.tar.gz
mv wordpress/* .
rm -rf wordpress

# Create wordpress configuration file, give permission and update database value
mv wp-config-sample.php wp-config.php
sudo chmod 777 wp-config.php
sudo sed -i "s/database_name_here/${db_name}/g" wp-config.php
sudo sed -i "s/username_here/${username}/g" wp-config.php
sudo sed -i "s/password_here/${password}/g" wp-config.php
sudo sed -i "s/localhost/${rds_endpoint}/g" wp-config.php
sudo chmod -R 755 .
sudo chown -R ec2-user:apache /var/www/html/wordpress

# Make apache autostart and restart apache
sudo systemctl enable httpd
sudo systemctl reload httpd
