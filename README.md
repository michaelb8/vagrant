# OMiLab deployment via Vagrant

Virtual machine with Tomcat, Mysql for the dynamic deployment.

Website: [http://omilab.org](http://omilab.org)

GitLab: [https://gitlab.dke.univie.ac.at/explore](https://gitlab.dke.univie.ac.at/explore)

## Vagrant
- Portforwards: 
    - 80 to 6000
    - 8080 to 6080
- Logs of the tomcat will be synced in logs\
- Content of the tomcat will be synced in webapps\
- configs\ will be synced to the \home\vagrant\configs

### Scripts
- Shell commands for box installation (Tomcat, mysql) are in *Commands*
- SQL for each microservice database is stored in configs\sql\service
    - Will be executed through *Database*