echo "############ Create workspace ############"
sudo mkdir /home/vagrant/workspace
cd /home/vagrant/workspace

echo "############ Checkout repositories ############"
git clone https://gitlab.dke.univie.ac.at/omilab-core-infrastructure/PSM.git
git clone https://gitlab.dke.univie.ac.at/omilab-core-infrastructure/ActivityLoggingService.git
git clone https://gitlab.dke.univie.ac.at/omilab-services/DownloadService.git
git clone https://gitlab.dke.univie.ac.at/omilab-core-infrastructure/RoleService.git
git clone https://gitlab.dke.univie.ac.at/omilab-services/TextService.git

echo "############ Build binaries ############"
##
cd /home/vagrant/workspace/PSM
sudo mvn -Pdistribution clean package

cd /home/vagrant/workspace/ActivityLoggingService
sudo mvn -Pdistribution clean package

##
cd /home/vagrant/workspace/DownloadService
sudo mvn -Pdistribution clean package

##
cd /home/vagrant/workspace/RoleService
sudo mvn -Pdistribution clean package

##
cd /home/vagrant/workspace/TextService
sudo mvn -Pdistribution clean package

echo "############ Stop tomcat8 ############"
sudo systemctl stop tomcat8

echo "############ Copy binaries ############"
sudo cp /home/vagrant/workspace/PSM/target/*.war /var/lib/tomcat8/webapps
sudo cp /home/vagrant/workspace/ActivityLoggingService/target/*.war /var/lib/tomcat8/webapps
sudo cp /home/vagrant/workspace/DownloadService/target/*.war /var/lib/tomcat8/webapps
sudo cp /home/vagrant/workspace/RoleService/target/*.war /var/lib/tomcat8/webapps
sudo cp /home/vagrant/workspace/TextService/target/*.war /var/lib/tomcat8/webapps

echo "############ Restart tomcat8 ############"
sudo systemctl start tomcat8