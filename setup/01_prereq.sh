# Disable firewall to allow broadcasts,
# and we're in a VBox sandbox anyway
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# For epics base
sudo dnf install -y perl
sudo dnf install -y readline-devel

# For sequencer
sudo dnf install -y re2c

# For CSS
sudo dnf install -y java-21-openjdk-devel

# Stuff
sudo dnf install -y htop

# Shell settings
sudo cp $HOME/training/tools/training_profile.sh /etc/profile.d

