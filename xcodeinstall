#!/bin/bash

# Actualizar y instalar dependencias
apt-get update
apt-get install -y libxslt1-dev libcurl3 libgeoip-dev python nano wget unzip

# Descargar e instalar Xtream UI
wget https://lofertech.com/xui/install.py -O /tmp/install.py
python /tmp/install.py

# Configuración para habilitar el acceso root
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
service ssh restart

# Cambiar la contraseña de root (cambia "newpassword" por tu contraseña deseada)
echo "root:newpassword" | chpasswd

# Iniciar la instalación de Xtream UI
python /tmp/install.py

# Limpiar archivos temporales
rm /tmp/install.py

# Comando para actualizar Xtream UI a la versión R22F
apt-get install -y unzip e2fsprogs python-paramiko
rm -rf /home/xtreamcodes/iptv_xtream_codes/admin
rm -rf /home/xtreamcodes/iptv_xtream_codes/pytools
wget "https://lofertech.com/xui/update.zip" -O /tmp/update.zip
unzip /tmp/update.zip -d /tmp/update/
cp -rf /tmp/update/XtreamUI-master/* /home/xtreamcodes/iptv_xtream_codes/

# Establecer permisos y actualizar GeoLite2.mmdb
rm -rf /tmp/update/XtreamUI-master
rm /tmp/update.zip
rm -rf /tmp/update
chmod +x /home/xtreamcodes/iptv_xtream_codes/nginx/sbin/nginx
chmod +x /home/xtreamcodes/iptv_xtream_codes/nginx_rtmp/sbin/nginx_rtmp
chattr -i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb
wget -q https://lofertech.com/xui/GeoLite2.mmdb -O /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb
chattr +i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb
/home/xtreamcodes/iptv_xtream_codes/start_services.sh

# Configurar el panel para iniciar automáticamente
echo "@reboot root /home/xtreamcodes/iptv_xtream_codes/start_services.sh" >> /etc/crontab

echo "Instalación completada. Accede a tu panel en http://yourserverip:25500"
