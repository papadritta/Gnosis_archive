#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/papadritta/scripts/main/main.sh)
printLogo

printCyan "Updating packages..." && sleep 1
apt update -y && apt upgrade -y && apt autoremove -y

printCyan "Delete Nethermind..." && sleep 1
cd $HOME
sudo systemctl stop nethermind.service
sudo systemctl disable nethermind.service
sudo rm -rf /etc/systemd/system/nethermind.service
sudo rm -rf /usr/local/bin/nethermind
sudo rm -rf /var/lib/nethermind
sudo rm -rf /home/nethermind
sudo rm -rf /root/nethermind
sudo rm -rf ~/nethermind/configs/gnosis_archive_rpc.cfg

printLine

printCyan "Check Nethermind status..." && sleep 1
if [[ `service nethermind status | grep active` =~ "running" ]]; then
  echo -e "Your nethermind \e[32m.was not deleted correctly\e[39m, run command again!"
else
  echo -e "Your nethermind \e[31m. was fully deleted\e[39m."
fi
