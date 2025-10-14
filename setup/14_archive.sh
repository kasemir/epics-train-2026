echo "== Archive"

sudo dnf install -y mariadb-server
sudo systemctl start mariadb
# sudo systemctl enable mariadb.service

# Equivalent of
# sudo /usr/bin/mysql_secure_installation"

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$root'; FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

mysql -u root -p'$root' </ics/training/tools/phoebus/services/archive-engine/dbd/MySQL.dbd

