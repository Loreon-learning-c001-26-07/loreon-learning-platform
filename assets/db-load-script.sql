USE learningdb;
CREATE TABLE courses (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Duration varchar(255) default NULL, ImageUrl varchar(255) default NULL,Description text default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO courses (Name,Duration,ImageUrl,Description) VALUES 
("DevOps Engineering","12 weeks","c-1.png","Master CI/CD, containerization, and infrastructure automation"),
("Cybersecurity Fundamentals","10 weeks","c-2.png","Learn ethical hacking, security protocols, and threat analysis"),
("AI & Machine Learning","16 weeks","c-3.png","Build intelligent systems with Python, TensorFlow, and deep learning"),
("Cloud Engineering","14 weeks","c-4.png","Design scalable cloud solutions on AWS, Azure, and GCP"),
("FinOps & Cost Optimization","8 weeks","c-5.png","Optimize cloud costs and implement financial operations"),
("Data Engineering","12 weeks","c-6.png","Build data pipelines, ETL processes, and analytics platforms"),
("Site Reliability Engineering","10 weeks","c-7.png","Ensure system reliability, monitoring, and incident response"),
("Kubernetes & Container Orchestration","8 weeks","c-8.png","Master container deployment and orchestration at scale");