#bash/bin! 

#Provisionnement shell
 !/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo "==> Réparation éventuelle de dpkg"
dpkg --configure -a || true
apt-get install -f -y || true

echo "==> Mise à jour APT"
apt-get update -y

echo "==> Installation Apache2 + PHP minimal"
apt-get install -y apache2 php php-cli libapache2-mod-php

echo "==> Activation d'Apache au démarrage"
systemctl enable apache2
systemctl restart apache2

echo "==> Préparation du dossier partagé"
mkdir -p /var/www/html-shared

echo "==> Lien symbolique /var/www/html -> /var/www/html-shared"
rm -rf /var/www/html
ln -s /var/www/html-shared /var/www/html

echo "==> Création de index.html dans le dossier partagé"
cat > /var/www/html-shared/index.html <<'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Test LAMP Vagrant</title>
</head>
<body>
  <h1>VM lamp-server (Vagrant / Debian 12)</h1>
  <p>Si tu vois cette page via le port 7676, tout fonctionne.</p>
</body>
</html>
EOF
chown www-data:www-data /var/www/html/index.html

    echo "Bienvenue sur la VM lamp-server (LAMP via Vagrant - Debian 12)" > /etc/motd