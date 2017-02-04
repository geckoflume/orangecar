#!/bin/bash

apt-get update && apt-get upgrade && apt-get autoremove
apt-get -y install update-usbids  linux-headers-sun8i  build-essential fakeroot dpkg-dev
wget http://cdn-cw.mediatek.com/Downloads/linux/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2
tar -jxvf DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2
rm DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2
cd DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/
make
make install
modprobe mt7601Usta
nano /etc/network/interfaces
ifup ra0
echo "#!/bin/bash" > ra0restart
echo "ifdown ra0" >> ra0restart
echo "ifup ra0" >> ra0restart
chmod 755 ra0restart
mv ra0restart /usr/local/bin/
cd ..
rm -r DPO_MT7601U_LinuxSTA_3.0.0.4_20130913
exit 0