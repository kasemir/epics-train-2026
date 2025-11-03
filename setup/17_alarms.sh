echo "== Alarms"

cd /ics/tools
rm -rf kafka

wget https://dlcdn.apache.org/kafka/4.1.0/kafka_2.13-4.1.0.tgz
#wget https://dlcdn.apache.org/kafka/3.9.1/kafka_2.13-3.9.1.tgz

tar vzxf kafka_*tgz
rm kafka_*tgz
mv kafka_* kafka

cd kafka

# Update to use /var/kafka instead of /tmp
sudo rm -rf /var/kafka
sudo mkdir /var/kafka
sudo chown epics-dev /var/kafka
sed -i 's/log.dirs=\/tmp\/.*/log.dirs=\/var\/kafka/' config/server.properties

# Initialize log.dirs
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
bin/kafka-storage.sh format --standalone -t $KAFKA_CLUSTER_ID -c config/server.properties

# Install kafka as service
sudo cp /ics/tools/kafka.service /etc/systemd/system
sudo systemctl daemon-reload
# SELinux will prevent systemd from running kafka-server-start.sh
# Disable SELinux on next reboot...
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
# .. and right now
sudo setenforce 0


sudo systemctl start kafka
sudo systemctl status kafka
sudo systemctl enable kafka.service
# Wait for it to start...
sleep 60
netstat -an | fgrep 9092

cd ..
# TODO No longer necessary? Start alarm server to auto-create?
./create_alarm_topics.sh Accelerator
./list_topics.sh

