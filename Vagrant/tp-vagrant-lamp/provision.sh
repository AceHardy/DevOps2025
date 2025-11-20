#!/bin/bash
set -e  

apt update -y

apt install -y apache2 php php-cli

systemctl enable apache2

echo "Nettoyage de /var/www/html"
rm -rf /var/www/html/*

echo "Message MOTD"
echo "VM TP – LAMP Server" > /etc/motd

echo "Terminé."
