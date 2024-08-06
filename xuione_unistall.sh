#!/bin/bash

# Paquetes a eliminar
packages=(
    "iproute2"
    "python"
    "net-tools"
    "dirmngr"
    "gpg-agent"
    "software-properties-common"
    "libmaxminddb0"
    "libmaxminddb-dev"
    "mmdb-bin"
    "libcurl4"
    "libgeoip-dev"
    "libxslt1-dev"
    "libonig-dev"
    "e2fsprogs"
    "wget"
    "mariadb-server"
    "sysstat"
    "alsa-utils"
    "v4l-utils"
    "mcrypt"
    "certbot"
    "iptables-persistent"
    "libjpeg-dev"
    "libpng-dev"
    "php-ssh2"
    "xz-utils"
    "zip"
    "unzip"
)

# Paquetes adicionales a eliminar
extra_packages=(
    "mysql-server"
)

# Desinstalar los paquetes
echo "Desinstalando paquetes..."
for package in "${packages[@]}" "${extra_packages[@]}"; do
    echo "Desinstalando $package..."
    sudo apt-get remove --purge -y "$package"
done

# Eliminar directorios y archivos creados por el script
echo "Eliminando directorios y archivos..."
sudo rm -rf /home/xui
sudo rm -f /etc/systemd/system/xuione.service
sudo rm -f /etc/mysql/my.cnf
sudo rm -rf /etc/mysql
sudo rm -f /etc/sysctl.conf
sudo rm -rf /home/xui/bin/redis
sudo rm -f /home/xui/bin/nginx/conf/codes/setup.conf

# Eliminar usuarios y grupos creados
echo "Eliminando usuarios y grupos..."
sudo deluser --remove-home xui
sudo delgroup xui

# Eliminar configuraciones adicionales
echo "Eliminando configuraciones adicionales..."
sudo sed -i '/DefaultLimitNOFILE=655350/d' /etc/systemd/system.conf
sudo sed -i '/DefaultLimitNOFILE=655350/d' /etc/systemd/user.conf

# Recargar demonios de systemd y aplicar cambios de sysctl
echo "Recargando demonios de systemd y aplicando cambios de sysctl..."
sudo systemctl daemon-reload
sudo sysctl -p

# Confirmación de desinstalación
echo "Desinstalación completada."

