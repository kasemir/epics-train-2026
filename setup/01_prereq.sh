# Disable firewall to allow broadcasts,
# and we're in a VBox sandbox anyway
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Create 'expert' user for ASDG tests etc.
sudo /sbin/adduser expert
echo 'expert:$expert' | sudo chpasswd

# For epics base
sudo dnf install -y perl
sudo dnf install -y readline-devel

# For sequencer
sudo dnf install -y re2c

# For asyn (skipped with disabled VXI11 support)
# sudo dnf install -y rpcgen libtirpc-devel

# For stream
sudo dnf install -y pcre-devel

# For PVXS
sudo dnf install -y libevent-devel

# For P4P
sudo dnf install -y python3-pip
sudo dnf install -y python3-devel

# For CSS
sudo dnf install -y java-21-openjdk-devel

# Stuff
sudo dnf install -y htop

# Shell settings
sudo cp /ics/setup/training_profile.sh /etc/profile.d

