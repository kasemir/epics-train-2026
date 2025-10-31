# Disable firewall to allow broadcasts,
# and we're in a VBox sandbox anyway
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Create 'expert' user for ASDG tests etc.
sudo /sbin/adduser expert
echo 'expert:$expert' | sudo chpasswd

# Stuff
sudo dnf install -y htop

# Shell settings
sudo cp /ics/setup/training_profile.sh /etc/profile.d

# Desktop
sudo dnf install -y gnome-tweaks
gsettings set org.gnome.desktop.background picture-uri file:////ics/EPICS.png
gsettings set org.gnome.desktop.background picture-options scaled
# gsettings set org.gnome.desktop.background picture-options centered
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'lower'
gsettings set org.gnome.desktop.wm.preferences action-right-click-titlebar 'menu'
gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'toggle-maximize'

