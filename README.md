# Loreon Learning Platform

This is a learning platform application built for tech skill development and training.

## Available Courses

- **DevOps Engineering** - Master CI/CD, containerization, and infrastructure automation
- **Cybersecurity Fundamentals** - Learn ethical hacking, security protocols, and threat analysis  
- **AI & Machine Learning** - Build intelligent systems with Python, TensorFlow, and deep learning
- **Cloud Engineering** - Design scalable cloud solutions on AWS, Azure, and GCP
- **FinOps & Cost Optimization** - Optimize cloud costs and implement financial operations
- **Data Engineering** - Build data pipelines, ETL processes, and analytics platforms
- **Site Reliability Engineering** - Ensure system reliability, monitoring, and incident response
- **Kubernetes & Container Orchestration** - Master container deployment and orchestration at scale

## Deploy Pre-Requisites

1. Install FirewallD

```bash
sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
```

## Deploy and Configure Database

1. Install MariaDB

```bash
sudo yum install -y mariadb-server
sudo vi /etc/my.cnf
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

2. Configure firewall for Database

```bash
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload
```

3. Configure Database

```sql
$ mysql
MariaDB > CREATE DATABASE learningdb;
MariaDB > CREATE USER 'learninguser'@'localhost' IDENTIFIED BY 'learningpassword';
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'learninguser'@'localhost';
MariaDB > FLUSH PRIVILEGES;
```

> ON a multi-node setup remember to provide the IP address of the web server here: `'learninguser'@'web-server-ip'`

4. Load Course Information to database

Run the SQL script:

```bash
sudo mysql < db-load-script.sql
```

## Deploy and Configure Web

1. Install required packages

```bash
sudo yum install -y httpd php php-mysqlnd
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload
```

2. Configure httpd

Change `DirectoryIndex index.html` to `DirectoryIndex index.php` to make the php page the default page

```bash
sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf
```

3. Start httpd

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

4. Deploy code

```bash
sudo cp -r * /var/www/html/
```

5. Create and Configure the `.env` File

Create an `.env` file in the root of your project folder:

```bash
cat > /var/www/html/.env <<-EOF
DB_HOST=localhost
DB_USER=learninguser
DB_PASSWORD=learningpassword
DB_NAME=learningdb
EOF
```

> ON a multi-node setup, remember to provide the IP address of the database server in the .env file.

6. Test

```bash
curl http://localhost
```

## Features

- Course catalog with tech skills focus
- Responsive design for mobile and desktop
- Database-driven content management
- Environment-based configuration
- Search functionality for courses