echo "############ Configure / Update OS ############"
# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Basic Linux Stuff
#apt-get install -y git

# Apache
#apt-get install -y apache2

# Enable Apache Mods
#a2enmod rewrite

#Add Onrej PPA Repo
#apt-add-repository ppa:ondrej/php
#apt-get update

# Install PHP
#apt-get install -y php7.2

# PHP Apache Mod
# apt-get install -y libapache2-mod-php7.2

# Restart Apache
#service apache2 restart

# PHP Mods
# apt-get install -y php7.2-common
# apt-get install -y php7.2-mcrypt
# apt-get install -y php7.2-zip

echo "############ Install MYSQL ############"
# Set MySQL Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
apt-get install -y mysql-server

# PHP-MYSQL lib
#apt-get install -y php7.2-mysql

# phpmyadmin
#apt-get install -y phpmyadmin
#sudo php5enmod mcrypt

# Restart Apache
#sudo service apache2 restart

echo "############ Install JDK ############"
# Install JDK
sudo apt-get install -y default-jdk

#echo "############ Install Tomcat (manual) ############"
# User and Usergroup for Tomcat
#sudo mkdir /opt/tomcat
#sudo groupadd tomcat
#sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Install Tomcat
#cd /opt/tomcat
#sudo curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz
#sudo tar xvzf apache-tomcat-8.5.32.tar.gz
#sudo rsync -av apache-tomcat-8.5.32/ .
#sudo rm -rf apache-tomcat-8.5.32*

# Tomcat Permission
#sudo chgrp -R tomcat /opt/tomcat
#cd /opt/tomcat
#sudo chmod -R g+r conf
#sudo chmod g+x conf
#sudo chown -R tomcat webapps/ work/ temp/ logs/
#sudo chmod -R 750 bin/

echo "############ Install Tomcat (via package manager) ############"
sudo apt-get install -y tomcat8 tomcat8-admin

cd /var/lib/tomcat8/
sudo mkdir indexes
sudo chown -R tomcat8:tomcat8 indexes/

# Copy Tomcat manager configuration
#cd /home/vagrant

echo "############ Copy tomcat configuration ############"

sudo cp /home/vagrant/configs/tomcat-users.xml /etc/tomcat8/tomcat-users.xml
#
sudo cp /home/vagrant/configs/tomcat8 /etc/default/tomcat8

echo "############ Restart tomcat8 ############"
sudo systemctl restart tomcat8

#echo "############ Configure mysql ############"
#sudo chown 0644 /home/vagrant/configs/mysql_config.cnf

echo "############ Install maven ############"
sudo apt-get install -y maven

# Reload Tomcat configuration
#sudo initctl reload-configuration

# Start Tomcat service
sudo systemctl restart tomcat8