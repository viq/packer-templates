# set system pkg path
echo " "
echo "Setting system PKG_PATH"
echo "installpath = http://ftp5.eu.openbsd.org/ftp/pub/OpenBSD/snapshots/packages/$(arch -s)" > /etc/pkg.conf

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

echo "SUDO=sudo -E" >> /etc/mk.conf
echo 'PORTSDIR_PATH=${PORTSDIR}:$(PORTSDIR)/openbsd-wip:${PORTSDIR}/mystuff' >> /etc/mk.conf
