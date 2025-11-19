#bash/bin! 

# Provisionnement shell

    set -e

    
    dnf -y update || yum -y update #==> Mise à jour YUM/DNF

    dnf -y install httpd php php-cli || yum -y install httpd php php-cli

    systemctl enable httpd
    systemctl restart httpd

    rm -rf /var/www/html/*

    cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Test LAMP Vagrant</title>
</head>
<body>
  <h1>VM lamp-server (Vagrant / Oracle Linux 8)</h1>
  <p>Si tu vois cette page via le port 7676, tout fonctionne.</p>
</body>
</html>
EOF

    echo "Bienvenue sur la VM lamp-server (LAMP via Vagrant - Oracle Linux 8)" > /etc/motd
