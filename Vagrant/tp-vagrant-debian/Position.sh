#!/bin/bash
    set -e
    export DEBIAN_FRONTEND=noninteractive

    apt-get update -y
    apt-get install -y apache2 php php-cli libapache2-mod-php

    systemctl enable apache2
    systemctl restart apache2

    rm -rf /var/www/html/*
    cat > /var/www/html/index.html <<'EOF'

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Test LAMP Vagrant</title>
</head>
<body>
  <h1>VM lamp-server (Vagrant / Debian 13)</h1>
  <p>Si tu vois cette page via le port 7676, tout fonctionne.</p>
</body>
</html>
EOF
    echo "Bienvenue sur la VM lamp-server (LAMP via Vagrant - Debian 13)" > /etc/motd