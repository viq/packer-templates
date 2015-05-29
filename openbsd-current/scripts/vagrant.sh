# Set up Vagrant.

sudo sh -c "date > /etc/vagrant_box_build_time"

# Create puppet user/group
echo " "
echo " Creating puppet user / group "
echo " "
sudo groupadd puppet
sudo useradd -g puppet -d /var/lib/puppet -s /usr/bin/false puppet

# Add groups puppet and chef
sudo groupadd puppet
sudo groupadd chef

# setup the vagrant key
# you can replace this key-pair with your own generated ssh key-pair
echo " "
echo " Setting the vagrant ssh pub key "
echo " "
sudo -u vagrant mkdir /home/vagrant/.ssh
sudo -u vagrant chmod 700 /home/vagrant/.ssh
sudo -u vagrant chown vagrant.vagrant /home/vagrant/.ssh
sudo -u vagrant touch /home/vagrant/.ssh/authorized_keys
sudo -u vagrant ftp -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
sudo -u vagrant chmod 600 /home/vagrant/.ssh/authorized_keys
chown vagrant.vagrant /home/vagrant/.ssh/authorized_keys
