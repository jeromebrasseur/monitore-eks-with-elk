# Monitore EKS cluster with ELK (Elasticsearch Logstach Kibana)

<p align="center"><img src="img/angular-cicd.png" width="50%"></p>

----

This repo provides the steps to deploy Angular HelloWorld on EC2 instance using Jenkins. Jenkins is an open-source automation server tool. It helps automate the build, testing, and deployment aspects of software development, and facilitates continuous integration and continuous delivery.

----

## Prepare your EC2

Open these ports :

- 22 (SSH)
- 9200 (Elasticsearch)
- 5601 (Kibana)
- 5044 (Logstash, si utilisé)

##### Install Node.js and Angular CLI

```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g @angular/cli
```

##### Install Nginx

```
sudo apt update
sudo apt install nginx

sudo chown -R jenkins:jenkins /var/www/html
```

## Build/Test application

##### Dev mode

```
git clone https://github.com/jeromebrasseur/angular-helloworld-on-ec2.git
cd angular-helloworld-on-ec2
ng serve --host 0.0.0.0 --port 4200
```

##### Production mode

Use Jenkinsfile to build/test/deploy the angular app.
