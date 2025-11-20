apt-get update
apt-get install -y mariadb-server
sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl enable mariadb
systemctl restart mariadb
mysql < /vagrant/db_sql/db_init.sql