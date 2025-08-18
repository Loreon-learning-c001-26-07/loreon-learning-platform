#!/bin/bash

sudo apt install -y firewalld 
sudo systemctl start firewalld
sudo systemctl enable firewalld (so that the service starts on boot )
sudo systemctl status firewalld - verify that the service is running 

#-------Database Configuration--------
sudo apt install mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql
sudo systemctl status mysql```
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload

 cat > configure-db.sql <<-EOF
 CREATE DATABASE learningdb;
 CREATE USER 'learnuser'@'localhost' IDENTIFIED BY 'learnpassword';
 GRANT ALL PRIVILEGES ON *.* TO 'learnuser'@'localhost';
 FLUSH PRIVILEGES;
 <<-EOF
 
 sudo mysql <configure-db.sql
 
 cat > db-load-script.sql <<-EOF

USE learningdb;
CREATE TABLE courses (id mediumint(8) unsigned NOT NULL auto_increment,
Name varchar(255) default NULL,
Duration varchar(255) default NULL, 
ImageUrl varchar(255) default NULL,
Description text default NULL,
PRIMARY KEY (id)) AUTO_INCREMENT=1
);
INSERT INTO courses (Name,Duration,ImageUrl,Description) VALUES
("DevOps Engineering","12 weeks","c-1.png","Master CI/CD, containerization, and infrastructure automation"),
("Cybersecurity Fundamentals","10 weeks","c-2.png","Learn ethical hacking, security protocols, and threat analysis"),
("AI & Machine Learning","16 weeks","c-3.png","Build intelligent systems with Python, TensorFlow, and deep learning"),
("Cloud Engineering","14 weeks","c-4.png","Design scalable cloud solutions on AWS, Azure, and GCP"),
("FinOps & Cost Optimization","8 weeks","c-5.png","Optimize cloud costs and implement financial operations"),
("Data Engineering","12 weeks","c-6.png","Build data pipelines, ETL processes, and analytics platforms"),
("Site Reliability Engineering","10 weeks","c-7.png","Ensure system reliability, monitoring, and incident response"),
("Kubernetes & Container Orchestration","8 weeks","c-8.png","Master container deployment and orchestration at scale");
EOF

sudo mysql < db-load-script.sql

#-------Webserver configuration--------
sudo apt update && sudo apt upgrade
sudo apt install -y apache2 php libapache2-mod-php php-mysql
sudo systemctl start apache2
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

sudo sed -i 's/index.html/index.php/g' /etc/apache2/mods-enabled/dir.conf

sudo systemctl start apache2
sudo systemctl enable apache2

sudo apt install -y git
sudo rm -rf /var/www/html/*
sudo git clone https://github.com/Loreon-learning-c001-26-07/loreon-learning-platform.git /var/www/html/
