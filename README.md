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


## Install ELK stack

```
.\install_elk.sh
```
