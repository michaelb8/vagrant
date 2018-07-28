# -*- mode: ruby -*-
# vi: set ft=ruby :

#Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure("2") do |config|

  # Box Settings
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 5116
    vb.cpus = 1
  end

  # Network Settings
  config.vm.network "forwarded_port", guest: 8080, host: 6080
  config.vm.network "forwarded_port", guest: 80, host: 6000
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  # config.vm.network "private_network", ip: "192.168.33.10"

  #config.ssh.username = 'root'
  #config.ssh.password = 'password'
  #config.ssh.insert_key = 'true'

  # Folder Settings
  config.vm.synced_folder "configs/", "/home/vagrant/configs"
  #config.vm.synced_folder "logs/tomcat/", "/var/lib/tomcat8/logs"
  #config.vm.synced_folder "webapps/", "/var/lib/tomcat8/webapps"
  #config.vm.synced_folder "logs/apache/", "/var/log/apache2"
  
  config.vm.provision "shell", path: "Commands.sh"
  config.vm.provision "shell", path: "Database.sh"
end
