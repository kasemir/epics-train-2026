echo "== Archive"

sudo dnf install -y lynx
sudo dnf install -y mariadb-server
sudo systemctl start mariadb
# sudo systemctl enable mariadb.service

# Interactive setup, doesn't seem to do more than set PW
# sudo /usr/bin/mysql_secure_installation"

# Set root PW
sudo mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$root';
FLUSH PRIVILEGES;
EOF

# Install archive tables
mysql -u root -p'$root' </ics/training/tools/phoebus/services/archive-engine/dbd/MySQL.dbd

# Check for demo channels
mysql -u report -p'$report' \
      -e 'SELECT channel_id, name FROM channel;' archive

mysql -u report -p'$report' \
      -e 'SELECT * FROM smpl_eng;' archive

