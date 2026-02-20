#!/usr/bin/env bash
 
# IP adresa Zabbix serveru (Zabbix Appliance)
ZABBIX_SERVER_IP="192.168.1.3"
 
# Instalace Zabbix agenta 2
apt update
apt install -y wget
 
wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_7.0-4+debian13_all.deb
dpkg -i zabbix-release_7.0-4+debian13_all.deb
apt update
apt install -y zabbix-agent2
 
# Úprava konfigurace
sed -i "s/^Server=.*/Server=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agent2.conf
sed -i "s/^ServerActive=.*/ServerActive=$ZABBIX_SERVER_IP/" /etc/zabbix/zabbix_agent2.conf
 
# Restart služby
systemctl enable zabbix-agent2
systemctl restart zabbix-agent2