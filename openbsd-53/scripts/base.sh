# set system pkg path
echo " "
echo "Setting system PKG_PATH"
echo "installpath = http://ftp.eu.openbsd.org/pub/OpenBSD/5.3/packages/$(arch -s)" > /etc/pkg.conf

# install wget/curl/bash/vim and its dependencies
echo " "
echo " Installing needed packages "
echo " "
pkg_add wget curl bash vim--no_x11 rsync-- bzip2 ngrep cvsutils git

# giving root & vagrant bash as shell
#echo " "
#echo " Giving root/vagrant bash as a shell "
#echo " "
#usermod -s /usr/local/bin/bash vagrant
#usermod -s /usr/local/bin/bash root

# sudo
# Defaults requiretty is not present in the sudoers file
# env_keep I'll leave it as it is since user's path is same or more comprehensive than root's path
echo " "
echo " Setting sudo to work with vagrant "
echo " "
echo "# Uncomment to allow people in group wheel to run all commands without a password" >> /etc/sudoers
echo "%wheel        ALL=(ALL) NOPASSWD: SETENV: ALL" >> /etc/sudoers

/etc/rc.d/sendmail stop

# install the ports system for who wants to use it
echo " "
echo " Installing the ports system ! "
echo " "
cd /var/tmp
ftp http://ftp.eu.openbsd.org/pub/OpenBSD/5.3/ports.tar.gz
ftp http://ftp.eu.openbsd.org/pub/OpenBSD/5.3/src.tar.gz
ftp http://ftp.eu.openbsd.org/pub/OpenBSD/5.3/sys.tar.gz
cd /usr
mkdir ports
chown vagrant:vagrant ports
sudo -u vagrant tar xzf /var/tmp/ports.tar.gz
sudo tar xzf /var/tmp/src.tar.gz
cd src
sudo tar zxf /var/tmp/sys.tar.gz
rm /var/tmp/*.tar.gz
#cd /usr/ports
#cvschroot anoncvs@anoncvs.spacehopper.org:/cvs
echo "SUDO=sudo -E" >> /etc/mk.conf
echo 'PORTSDIR_PATH=${PORTSDIR}:$(PORTSDIR)/openbsd-wip:${PORTSDIR}/mystuff' >> /etc/mk.conf
