#!/bin/bash
set -x  # Enable debugging

# Uninstall Xtream UI (Xtream Codes)
sudo systemctl stop mysql.service
sudo apt purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-* -y
sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql 2>/dev/null
sudo apt autoremove -y
sudo apt autoclean -y
sudo pkill -u xtreamcodes 2>/dev/null
sudo kill $(ps aux | grep '[p]hp' | awk '{print $2}') 2>/dev/null
sudo kill $(ps aux | grep '[n]ginx' | awk '{print $2}') 2>/dev/null
sudo chattr -i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb 2>/dev/null
sudo rm -rf /home/xtreamcodes/iptv_xtream_codes/tmp/* 2>/dev/null
sudo rm -rf /home/xtreamcodes/iptv_xtream_codes/streams/* 2>/dev/null
sudo umount -f /home/xtreamcodes/iptv_xtream_codes/streams 2>/dev/null
sudo umount -f /home/xtreamcodes/iptv_xtream_codes/tmp 2>/dev/null
sudo sed -i '/xtreamcodes/d' /etc/fstab
sudo sed -i '/xtreamcodes/d' /etc/crontab
sudo sed -i '/xtreamcodes/d' /etc/sudoers
sudo deluser xtreamcodes 2>/dev/null
sudo groupdel xtreamcodes 2>/dev/null
sudo chown root:root -R /home/xtreamcodes 2>/dev/null
sudo chmod -R 0644 /home/xtreamcodes 2>/dev/null
sudo rm /var/lib/dpkg/lock-frontend /var/cache/apt/archives/lock /var/lib/dpkg/lock 2>/dev/null
sudo apt-get remove libcurl3 -y 2>/dev/null

# Removing StreamCreed Panel
sudo systemctl stop mariadb.service 2>/dev/null
sudo apt-get purge mariadb-server -y
sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql 2>/dev/null
sudo apt autoremove -y
sudo apt autoclean -y
sudo pkill -u streamcreed 2>/dev/null
sudo kill $(ps aux | grep '[p]hp' | awk '{print $2}') 2>/dev/null
sudo kill $(ps aux | grep '[n]ginx' | awk '{print $2}') 2>/dev/null
sudo rm -rf /home/streamcreed/tmp/* 2>/dev/null
sudo rm -rf /home/streamcreed/streams/* 2>/dev/null
sudo umount -f /home/streamcreed/streams 2>/dev/null
sudo umount -f /home/streamcreed/tmp 2>/dev/null
sudo sed -i '/streamcreed/d' /etc/fstab
sudo sed -i '/streamcreed/d' /etc/crontab
sudo sed -i '/streamcreed/d' /etc/sudoers
sudo deluser streamcreed 2>/dev/null
sudo groupdel streamcreed 2>/dev/null
sudo chown root:root -R /home/streamcreed 2>/dev/null
sudo chmod -R 0644 /home/streamcreed 2>/dev/null
