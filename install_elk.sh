#!/bin/bash

set -e

echo "🔧 Mise à jour du système..."
sudo apt update && sudo apt upgrade -y

echo "📥 Ajout des dépôts Elastic..."
sudo apt install -y apt-transport-https curl gnupg
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg
echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt update

echo "📦 Installation Elasticsearch, Kibana, Logstash..."
sudo apt install -y elasticsearch kibana logstash

echo "🔧 Configuration Elasticsearch..."
sudo tee -a /etc/elasticsearch/elasticsearch.yml > /dev/null <<EOF
network.host: 0.0.0.0
discovery.type: single-node
xpack.security.enabled: true
EOF

echo "🔧 Configuration Kibana..."
sudo tee -a /etc/kibana/kibana.yml > /dev/null <<EOF
server.host: "0.0.0.0"
elasticsearch.hosts: ["http://localhost:9200"]
EOF

echo "🔁 Activation des services..."
sudo systemctl enable --now elasticsearch
sudo systemctl enable --now kibana
sudo systemctl enable --now logstash

echo "⏳ Attente de démarrage d'Elasticsearch..."
sleep 30

echo "🔐 Initialisation du mot de passe utilisateur 'elastic'..."
PASSWORD=$(echo -e "y\n" | sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic -i | grep 'New value:' | awk '{print $3}')
echo "✅ Mot de passe Elastic : $PASSWORD"

echo "🚀 Stack ELK prête !"
echo "Accède à Kibana via : http://<EC2-IP>:5601"
